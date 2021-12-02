extends Area2D

var move_speed = 300

func _physics_process(delta):
	position.y += move_speed * delta

func _on_LaserPowerUpBody_body_entered(body):
	if body.name == "Player":
		Global.laserPowerUpAvail = true
		queue_free()
		print("Laser Powerup")
