extends KinematicBody2D
export var speed = 20
var velocity = Vector2()
var screen_size
onready var cooldownTimer := $CooldownTimer
#onready var raycast2d := $RayCast2D
#onready var vfx_line := $vfx_line
onready var raycast = $LaserPowerUp
var laserTimer = null

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
	
	if Input.is_action_just_pressed("ui_accept") && Global.bulletAvailable == true:
		fire()

	if Input.is_action_just_pressed("ui_b") && get_tree().get_current_scene().get_name() == "Variant":
		Global.laserPowerUp = true
		yield(get_tree().create_timer(4),"timeout")
		Global.laserPowerUp = false
	
	if Global.laserPowerUp == true:
		var laser = preload("res://LaserPowerUp.tscn")
		var firedlaser = laser.instance()
		firedlaser.position = Vector2(position.x, position.y)
		get_parent().add_child(firedlaser)
		
	
	#print(laserTimer)

func fire():
	if get_tree().get_current_scene().get_name() == "Main":
		var bullet = preload("res://Bullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x, position.y)
		get_parent().call_deferred("add_child", firedbullet)
		Global.bulletAvailable = false
		
	else:
		if (Global.rapidfirepu == true):
			var bullet = preload("res://Bullet.tscn")
			var firedbullet = bullet.instance()
			firedbullet.position = Vector2(position.x, position.y)
			get_parent().call_deferred("add_child", firedbullet)
		
		elif Global.currentBullet > 0 && Global.bulletAvailable == true:
			var bullet = preload("res://Bullet.tscn")
			var firedbullet = bullet.instance()
			firedbullet.position = Vector2(position.x, position.y)
			get_parent().call_deferred("add_child", firedbullet)
			#This is what plays a noise when a bullet is fired
			#$PlayerBulletSound.play()
			Global.currentBullet -= 1
			
		if Global.currentBullet == 0:
			Global.bulletAvailable = false
			reload()
		
func laser():
	var laser = preload("res://LaserPowerUp.tscn")
	var firedlaser = laser.instance()
	firedlaser.position = Vector2(position.x, position.y)
	get_parent().call_deferred("add_child", firedlaser)
	firedlaser.queue_free()
	#Global.laserPowerUp = false
	#yield(get_tree().create_timer(2),"timeout")
	#firedlaser.queue_free()
	#Global.laserPowerUp = true
	#$LaserPowerUp.enabled = true
	#$LaserPowerUp.visible = true
	#if raycast.is_colliding():
	#	var collide = raycast.get_collider()
		#print(raycast.get_collider().has_method())

func reload():
	print("RELOADING")
	yield(get_tree().create_timer(3),"timeout")
	Global.currentBullet = Global.maxBullet
	Global.bulletAvailable = true

func kill():
	get_tree().change_scene("res://GameOver.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	pass # Replace with function body.
