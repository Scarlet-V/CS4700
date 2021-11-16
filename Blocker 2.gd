extends KinematicBody2D

var shootingcount = rand_range(0,50)
export var move_speed = 10

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	
func kill():
	queue_free()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
