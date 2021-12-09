extends Area2D


var move_speed = 300

func _physics_process(delta):
	position.y += move_speed * delta




func _ready():
	pass # Replace with function body.



func _on_InvinciblePU_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.invinciblepu = true


func _on_Timer_timeout():
	pass # Replace with function body.
