extends Node2D


var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

export var move_speed = 100
export var vertical_distance = 20
var direction = Vector2(move_speed, 0)
var move = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if move:
		position += direction * delta
		checkForBorderHit()
		checkForBottomReached()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func checkForBorderHit():
	if position.x < 0 or position.x >= screenWidth:
		reverseDirection()

func checkForBottomReached():
	if position.y >= screenHeight:
		move = false

func reverseDirection():
	direction = -direction
	position.y += vertical_distance
