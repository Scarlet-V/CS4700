extends Node2D

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

#export var move_speed = 100
export var vertical_distance = 20
var direction = Vector2(Global.enemyMS, 0)
var move = true
export var shipWidth = 35
export var shipHeight = 100

signal cleared
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	if Global.timePu:
		Global.timePu = false
		Global.paused = true
		move = false
		print("start pause")
		yield(get_tree().create_timer(Global.timeDuration),"timeout")
		move = true
		Global.paused = false
		print("pause finished")
	if move:
		position += direction * delta
		checkForBorderHit()
		checkForBottomReached()
		#If all the enemies are killed tell Main in _on_Wave_cleared
	if waveCleared():
		Global.currentLevel += 1
		emit_signal("cleared", self)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func checkForBorderHit():
	#Check if any children have hit the border
	for child in get_children():
		if child.position.x + position.x < shipWidth or child.position.x + position.x >= screenWidth - shipWidth:
			reverseDirection()
			break

func checkForBottomReached():
	#Check if any children have reached the player
	for child in get_children():
		if child.position.y + position.y >= screenHeight - shipHeight:
			move = false
			get_tree().reload_current_scene()
			break

func reverseDirection():
	direction = -direction
	position.y += vertical_distance
	
func waveCleared():
	return get_child_count() == 0
