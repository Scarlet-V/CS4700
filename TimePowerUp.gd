extends Node2D



var move_speed = 300

func _physics_process(delta):
	position.y += move_speed * delta


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.timePu = true
