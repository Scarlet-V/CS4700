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
		start()

func start():
	var bullet = preload("res://Bullet.tscn")
	var firedbullet = bullet.instance()
	firedbullet.position = Vector2(position.x, position.y)
	get_parent().call_deferred("add_child", firedbullet)




