extends KinematicBody2D


var move_speed = 300
var delay = 1;
onready var cooldownTimer := $CooldownTimer

func _physics_process(delta):
	if Global.clone == true:
		if Input.is_action_just_pressed("ui_accept") && Global.clonebulletAvailable == true:
			print("clone fired")
			fire()
	
func _on_ClonePU_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.clone = true


func fire():
	if get_tree().get_current_scene().get_name() == "Variant":
		var clonebullet = load("res://CloneBullet.tscn")
		var clonefiredbullet = clonebullet.instance()
		clonefiredbullet.position = Vector2(position.x, position.y)
		get_parent().call_deferred("add_child", clonefiredbullet)
		Global.clonebulletAvailable = false
	else:
		if Global.clonecurrentBullet == 0:
			Global.clonebulletAvailable = false
			reload()

func reload():
	print("RELOADING")
	yield(get_tree().create_timer(1),"timeout")
	Global.clonecurrentBullet = Global.cloneMaxBullet
	Global.clonebulletAvailable = true


	
