extends KinematicBody2D

var speed = 250
var Velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		Velocity.x =- speed
	if Input.is_action_just_pressed("ui_right"):
		Velocity.x = speed
	move_and_slide(Velocity)
	
	if Input.is_action_just_pressed("ui_accept"):
		fire()
	
func fire():
	var bullet = preload("res://Bullet.tscn")
	var firedbullet = bullet.instance()
	firedbullet.position = Vector2(position.x,0)
	get_parent().call_deferred("add_child", firedbullet)		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
