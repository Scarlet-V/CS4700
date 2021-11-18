extends Area2D

var move_speed = 300

func _physics_process(delta):
	position.y += move_speed * delta


func _on_RapidFirePU_body_entered(body):
	if body.name == "Player":
		Global.maxBullet += 100
		Global.bulletAvailable = true
		queue_free()
