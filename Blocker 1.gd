extends KinematicBody2D

var shootingcount = rand_range(0,50)
export var move_speed = 100

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var vertical_distance = 20
var direction = Vector2(move_speed, 0)
var move = true

func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	#var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	pass
	
func kill():
	print("Blocker 1 Killed")
	Global.playerScore += 20
	if get_tree().get_current_scene().get_name() == "Variant":
		randomize()
		var rng = rand_range(0, 100)
		print("rng: " + str(rng))
		if rng <= 10 :
			var extrabulletpowerup = preload("res://ExtraBulletPowerUp.tscn")
			var _extrabulletpowerup = extrabulletpowerup.instance()
			_extrabulletpowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
			get_parent().get_parent().call_deferred("add_child", _extrabulletpowerup)
		elif rng <= 18 && Global.rapidfirepu == false:
			var rapidfirepowerup = preload("res://RapidFirePowerUp.tscn")
			var _rapidfirepowerup = rapidfirepowerup.instance()
			_rapidfirepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _rapidfirepowerup)
		elif rng <= 22:
			var invincible = preload("res://InvinciblePowerUp.tscn")
			var invinciblepuactive= invincible.instance()
			invinciblepuactive.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y)
			get_parent().get_parent().add_child(invinciblepuactive)
		elif rng <= 25 && !Global.laserPowerUpActive: 
			var laserpowerup = preload("res://LaserPowerUpIcon.tscn")
			var _laserpowerup = laserpowerup.instance()
			_laserpowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _laserpowerup)
		elif rng <= 29: #CHANGE -1 TO LIKE 28 IF WE WANT A 10% CHANCE
			var clonepowerup = preload("res://ClonePowerUp.tscn")
			var _clonepowerup = clonepowerup.instance()
			_clonepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _clonepowerup)			
		elif rng <= 33:
			var timepowerup = preload("res://TimePowerUp.tscn")
			var _timepowerup = timepowerup.instance()
			_timepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _timepowerup)	
	
	Global.blocker1HP -= 1
	
	if Global.blocker1HP == 0:
		Global.blocker1HP = Global.blocker1maxHP
		queue_free()
		
	if get_tree().get_current_scene().get_name() == "Main":
		Global.bulletAvailable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
