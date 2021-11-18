extends KinematicBody2D

var shootingcount = rand_range(0,50)
export var move_speed = 100

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var vertical_distance = 20
var direction = Vector2(move_speed, 0)
var move = true

func _physics_process(delta):
	#var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	pass
	
func kill():
	Global.bulletAvailable = true
	Global.playerScore += 20
	
	var rng = randi()
	if rng % 15 == 0:
		var rapidfirepowerup = preload("res://RapidFirePowerUp.tscn")
		var _rapidfirepowerup = rapidfirepowerup.instance()
		_rapidfirepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
		get_parent().get_parent().call_deferred("add_child", _rapidfirepowerup)
		
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
