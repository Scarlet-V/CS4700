extends Area2D

var move_speed = 300

func _physics_process(delta):
	position.y += move_speed * delta

func _on_ExtraBulletPowerUp_Body_body_entered(body):
	if body.name == "Player":
		Global.currentBullet += 1
		Global.maxBullet += 1
		queue_free()
