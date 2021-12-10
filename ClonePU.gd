extends Area2D

var move_speed = 300
var delay = 1;
onready var cooldownTimer := $CooldownTimer

func _physics_process(delta):
		position.y += move_speed * delta 

	
func _on_ClonePU_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.clone = true




	
