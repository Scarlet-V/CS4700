extends KinematicBody2D

var shootingcount = rand_range(0,30)

var shooting_count = 0
export var max_delay = 20	#Max time between shots
export var min_delay = 4	#Min time between shots
var shoot_delay = randi()%max_delay		#Time to wait until next shot
	
func _physics_process(delta):
	shooting_count += delta
	if shooting_count >= shoot_delay:
		var bullet = preload("res://Enemybullet.tscn")
		var fired_bullet = bullet.instance()
		fired_bullet.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
		get_parent().get_parent().call_deferred("add_child", fired_bullet)
		shoot_delay = randi()%(max_delay-min_delay) + min_delay
		shooting_count = 0
		#This is what makes the noise when a bullet is fired
		#$EnemyBulletMusic.play()
	#var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	
func kill():
	Global.playerScore += 40
	print(get_tree().get_current_scene().get_name() == "Variant")
	if get_tree().get_current_scene().get_name() == "Variant":
		var rng = randi()
		if rng % 5 == 0:
			var extrabulletpowerup = preload("res://ExtraBulletPowerUp.tscn")
			var _extrabulletpowerup = extrabulletpowerup.instance()
			_extrabulletpowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
			get_parent().get_parent().call_deferred("add_child", _extrabulletpowerup)
		if rng % 15 == 0 :
			var clonepowerup = preload("res://ClonePowerUp.tscn")
			var _clonepowerup = clonepowerup.instance()
			_clonepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _clonepowerup)
	Global.shooterHP -= 1
	
	if Global.shooterHP == 0:
		Global.shooterHP = Global.shootermaxHP
		queue_free()
	if get_tree().get_current_scene().get_name() == "Main":
		Global.bulletAvailable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
