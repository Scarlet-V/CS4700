extends KinematicBody2D

var shootingcount = rand_range(0,50)
export var move_speed = 3.5

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var vertical_distance = 50
var direction = Vector2(move_speed, 0)
var move = true

func _physics_process(delta):
	#var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	if move:
		position += direction
		checkForBorderHit()
		checkForBottomReached()
	
func kill():
	queue_free()

func checkForBorderHit():
	if position.x < 0 or position.x >= screenWidth:
		get_tree().call_group("Blockers2","reverseDirection")

func checkForBottomReached():
	if position.y >= screenHeight:
		move = false

func reverseDirection():
	direction = -direction
	position.y += vertical_distance

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
