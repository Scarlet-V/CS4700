extends KinematicBody2D

var shootingcount = rand_range(0,50)
var move_speed = 10

func _physics_process(delta):
	var collision = move_and_collide(Vector2.RIGHT * delta * move_speed)
	shootingcount +=delta
	if shootingcount >=50:
		var bullet = preload("res://Enemybullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x,position.y)
		get_parent().call_deferred("add_child", firedbullet)
		shootingcount = rand_range(0,50)
	
func kill():
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
