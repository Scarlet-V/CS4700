extends Area2D

var move_speed = 300

func _physics_process(delta):
	position.y += move_speed * delta

func _on_shot_body_entered(body):
	if Global.invinciblepu == false:
		if body.name == "Player":
			Global.playerHealth -= 1
			get_tree().reload_current_scene()
		if body.name == "Shot":
			queue_free()
