extends Area2D


func _physics_process(delta):
	position.y +=2


func _on_shot_body_entered(body):
	if body.name == "Ship":
		get_tree().reload_current_scene()
	if body.name == "Shot":
		queue_free()
