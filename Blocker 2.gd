extends KinematicBody2D

var shootingcount = rand_range(0,50)
export var move_speed = 100

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var vertical_distance = 50
var direction = Vector2(move_speed, 0)
var move = true

func _physics_process(delta):
	#var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	pass
	
func kill():
	Global.currentBullet += 1
	Global.playerScore += 10
	
	var rng = randi()
	print(rng % 10)
	if rng % 5 == 0:
		var extrabulletpowerup = preload("res://ExtraBulletPowerUp.tscn")
		var _extrabulletpowerup = extrabulletpowerup.instance()
		_extrabulletpowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
		get_parent().get_parent().call_deferred("add_child", _extrabulletpowerup)
	
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
