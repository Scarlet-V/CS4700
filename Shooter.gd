extends KinematicBody2D

export var move_speed = 10
var shooting_count = 0
export var max_delay = 20	#Max time between shots
export var min_delay = 4	#Min time between shots
var shoot_delay = randi()%max_delay		#Time to wait until next shot

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	shooting_count += delta
	if shooting_count >= shoot_delay:
		var bullet = load("res://Enemybullet.tscn")
		var fired_bullet = bullet.instance()
		fired_bullet.position = Vector2(position.x,position.y)
		get_parent().call_deferred("add_child", fired_bullet)
		shoot_delay = randi()%(max_delay-min_delay) + min_delay
		shooting_count = 0
	
func kill():
	queue_free()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
