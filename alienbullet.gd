extends Area2D

export var move_speed = 250 

func _physics_process(delta):
	position.y += move_speed * delta


func _on_shot_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
	if body.name == "Shot":
		queue_free()
