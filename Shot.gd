extends KinematicBody2D

var Move_Speed = 500
var Life_time = 2
var Life_spawn = 0

func _physics_process(delta):
	var collision = move_and_collide(Vector2.UP * delta * Move_Speed)
	if collision and collision.collider.has_method("kill"):
		collision.collider.kill()
		#print(collision.collider.has_method("kill"))
		queue_free()
		
	Life_spawn =+ delta
	if Life_spawn > Life_time:
		queue_free()
