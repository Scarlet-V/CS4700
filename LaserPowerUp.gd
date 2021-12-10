extends Area2D

onready var line = $Line2D
onready var end = $end
var max_distance = 10
onready var raycast = $LaserPowerUp

#onready var raycast = $RayCast

#func _ready():
	#cast_to = Vector2(max_distance, 0)

func _physics_process(delta):
	pass#queue_free()


func _on_Area2D_body_entered(body):
	#print(body.is_in_group("enemies"))
	if body.is_in_group("enemies"):
		body.kill()
		print("hit " + str(body))
