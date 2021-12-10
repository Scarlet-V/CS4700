extends KinematicBody2D
export var speed = 20
var velocity = Vector2()
var screen_size
onready var cooldownTimer := $CooldownTimer
#onready var raycast2d := $RayCast2D
#onready var vfx_line := $vfx_line
onready var raycast = $LaserPowerUp

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

	#if Input.is_action_just_pressed("ui_b") && get_tree().get_current_scene().get_name() == "Variant" && Global.laserPowerUpAvail == true:
	#	Global.laserPowerUp = true
	#	Global.laserPowerUpAvail = false
	#	yield(get_tree().create_timer(Global.laserPowerUpDuration),"timeout")
	#	Global.laserPowerUp = false
		
	#if Input.is_action_just_pressed("ui_v"):
	#	Global.lightningPowerUp = true
	#	Global.laserPowerUpAvail = false
	#	yield(get_tree().create_timer(Global.laserPowerUpDuration),"timeout")
	#	Global.lightningPowerUp = false
	
	if Global.laserPowerUp:
		Global.laserPowerUp = false
		Global.laserPowerUpActive = true
		var laser = preload("res://LaserPowerUp.tscn")
		var firedlaser = laser.instance()
		add_child(firedlaser)
		yield(get_tree().create_timer(Global.laserPowerUpDuration),"timeout")
		firedlaser.queue_free()
		Global.laserPowerUpActive = false
		
	if Global.lightningPowerUp:
		var lightning = preload("res://LaserPowerUp_2.tscn")
		var firedlightning= lightning.instance()
		firedlightning.position = Vector2(position.x, position.y)
		get_parent().add_child(firedlightning)
		
	if Global.invinciblepu:
		var barrier = preload("res://BarrierInvincible.tscn")
		var _barrier= barrier.instance()
		_barrier.position = Vector2(position.x, position.y)
		get_parent().add_child(_barrier)
		yield(get_tree().create_timer(Global.invinciblepuDuration),"timeout")
		Global.invinciblepu = false
		
	if Global.rapidfirepu:
		yield(get_tree().create_timer(Global.rapidfirepuDuration),"timeout")
		Global.rapidfirepu = false
		
	if Global.clone:
		Global.clone = false
		var clonepu = preload("res://Clone.tscn")
		var cloneactive = clonepu.instance()
		cloneactive.position = Vector2(position.x+100, position.y)
		get_parent().add_child(cloneactive)
		yield(get_tree().create_timer(Global.clonepuDuration),"timeout")
		
		

func fire():
	if get_tree().get_current_scene().get_name() == "Main":
		var bullet = preload("res://Bullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x, position.y)
		get_parent().call_deferred("add_child", firedbullet)
		Global.bulletAvailable = false
			#This is what plays a noise when a bullet is fired
		$PlayerBulletSound.play()

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
			Global.currentBullet -= 1
			
		if Global.currentBullet == 0:
			Global.bulletAvailable = false
			reload()

func reload():
	print("RELOADING")
	yield(get_tree().create_timer(1),"timeout")
	Global.currentBullet = Global.maxBullet
	Global.bulletAvailable = true
	if Global.clone == true:
		print("RELOADING")
		yield(get_tree().create_timer(1),"timeout")
		Global.clonecurrentBullet = Global.cloneMaxBullet
		Global.clonebulletAvailable = true

func kill():
	get_tree().change_scene("res://GameOver.tscn")
	print("Player Killed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	pass # Replace with function body.
