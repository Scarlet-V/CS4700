extends KinematicBody2D

var shootingcount = rand_range(0,50)
export var move_speed = 100

var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")

var vertical_distance = 20
var direction = Vector2(move_speed, 0)
var move = true

func _physics_process(delta):
	#var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	pass
	
func kill():
	Global.playerScore += 20
	if get_tree().get_current_scene().get_name() == "Variant":
		var rng = randi()
		if rng % 5 == 0:
			var extrabulletpowerup = preload("res://ExtraBulletPowerUp.tscn")
			var _extrabulletpowerup = extrabulletpowerup.instance()
			_extrabulletpowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)
			get_parent().get_parent().call_deferred("add_child", _extrabulletpowerup)
		if rng % 17 == 0 && Global.rapidfirepu == false:
			var rapidfirepowerup = preload("res://RapidFirePowerUp.tscn")
			var _rapidfirepowerup = rapidfirepowerup.instance()
			_rapidfirepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _rapidfirepowerup)
		if rng % 15 == 0 :
			var clonepowerup = preload("res://ClonePowerUp.tscn")
			var _clonepowerup = clonepowerup.instance()
			_clonepowerup.position = Vector2(position.x + get_parent().position.x, position.y + get_parent().position.y + 50)	
			get_parent().get_parent().call_deferred("add_child", _clonepowerup)
	
	Global.blocker1HP -= 1
	
	if Global.blocker1HP == 0:
		Global.blocker1HP = Global.blocker1maxHP
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
