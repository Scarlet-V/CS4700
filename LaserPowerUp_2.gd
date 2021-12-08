extends KinematicBody2D

onready var line = $Line2D
onready var end = $end
var max_distance = 1000
	
func _physics_process(delta):
	var collision = move_and_collide(Vector2.UP * 0)
	if collision and collision.collider.has_method("kill"):
		collision.collider.kill()
		#print(collision.collider.has_method("kill"))
		queue_free()
