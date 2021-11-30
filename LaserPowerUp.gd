extends RayCast2D

onready var line = $Line2D
onready var end = $end
var max_distance = 10
onready var raycast = $LaserPowerUp

#onready var raycast = $RayCast

func _ready():
	cast_to = Vector2(max_distance, 0)

func _physics_process(delta):
	if raycast and raycast.collider.has_method("kill"):
		raycast.collider.kill()
		queue_free()


	
#func _physics_process(delta):
	#print(is_colliding())
	#var enemy = get_collider()
	#print(enemy)
