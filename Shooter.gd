extends KinematicBody2D

var shootingcount = rand_range(0,30)

var shooting_count = 0
export var max_delay = Global.max_delay	#Max time between shots
export var min_delay = Global.min_delay	#Min time between shots
var shoot_delay = randi()%max_delay		#Time to wait until next shot

func _ready():
	add_to_group("enemies")
	
func _physics_process(delta):
	#If the wave isn't paused keep shooting
	if !Global.paused:
		shooting_count += delta
	if shooting_count >= shoot_delay:
		var bullet = preload("res://Enemybullet.tscn")
		var fired_bullet = bullet.instance()
		fired_bullet.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
		get_parent().get_parent().call_deferred("add_child", fired_bullet)
		print(max_delay)
		print(min_delay)
		shoot_delay = randi()%(max_delay-min_delay) + min_delay
		shooting_count = 0
		#This is what makes the noise when a bullet is fired
		#$EnemyBulletMusic.play()
	#var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	
func kill():
	print("Shooter Killed")
	Global.playerScore += 40
	if get_tree().get_current_scene().get_name() == "Variant":
		randomize()
		var rng = rand_range(0, 100)
		print("rng: " + str(rng))
		
		rng = 100
		
		if rng <= 10:
			var extrabulletpowerup = preload("res://ExtraBulletPowerUp.tscn")
			var _extrabulletpowerup = extrabulletpowerup.instance()
			_extrabulletpowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
			get_parent().get_parent().call_deferred("add_child", _extrabulletpowerup)
		elif rng <= 15 && Global.rapidfirepu == false:
			var rapidfirepowerup = preload("res://RapidFirePowerUp.tscn")
			var _rapidfirepowerup = rapidfirepowerup.instance()
			_rapidfirepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _rapidfirepowerup)
		elif rng <= 18 :
			var laserpowerup = preload("res://LaserPowerUpIcon.tscn")
			var _laserpowerup = laserpowerup.instance()
			_laserpowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _laserpowerup)
		elif rng <= 85: #CHANGE -1 TO LIKE 28 IF WE WANT A 10% CHANCE
			var clonepowerup = preload("res://ClonePowerUp.tscn")
			var _clonepowerup = clonepowerup.instance()
			_clonepowerup.position = Vector2(position.x + get_parent().position.x + 100, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _clonepowerup)
		elif rng <= 43:
			var invincible = preload("res://InvinciblePowerUp.tscn")
			var invinciblepuactive= invincible.instance()
			invinciblepuactive.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y)
			get_parent().get_parent().add_child(invinciblepuactive)
		else:
			var timepowerup = preload("res://TimePowerUp.tscn")
			var _timepowerup = timepowerup.instance()
			_timepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _timepowerup)
			
	Global.shooterHP -= 1
	
	if Global.shooterHP == 0:
		Global.shooterHP = Global.shootermaxHP
		queue_free()
	if get_tree().get_current_scene().get_name() == "Main":
		Global.bulletAvailable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
