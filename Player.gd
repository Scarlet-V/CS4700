extends KinematicBody2D

export var speed = 10
var velocity = Vector2()
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	var collision = move_and_collide(velocity * delta * speed)
	position.x = clamp(position.x, 0, screen_size.x)
	
	if Input.is_action_just_pressed("ui_accept"):
		fire()
	
func fire():
	var bullet = preload("res://Bullet.tscn")
	var firedbullet = bullet.instance()
	firedbullet.position = Vector2(position.x, position.y)
	get_parent().call_deferred("add_child", firedbullet)		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	pass # Replace with function body.