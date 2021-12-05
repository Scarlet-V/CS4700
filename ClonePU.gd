extends Area2D

var move_speed = 300
var delay = 1;
onready var cooldownTimer := $CooldownTimer

func _physics_process(delta):
	position.y += move_speed * delta 
	
	if Input.is_action_just_pressed("ui_accept") && Global.bulletAvailable == true:
		print("I am not firing")
		fire()
	
	
	
func _on_ClonePU_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.clone = true

#func start():
#	var bullet = preload("res://Bullet.tscn")
#	var firedbullet = bullet.instance()
#	firedbullet.position = Vector2(position.x+100, position.y)
#	get_parent().call_deferred("add_child", firedbullet)

func fire():
	if get_tree().get_current_scene().get_name() == "Variant":
		var bullet = preload("res://Bullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x+100, position.y)
		get_parent().call_deferred("add_child", firedbullet)
		Global.bulletAvailable = false
	else:
		if Global.currentBullet == 0:
			Global.bulletAvailable = false
			reload()

func reload():
	print("RELOADING")
	yield(get_tree().create_timer(1),"timeout")
	Global.currentBullet = Global.maxBullet
	Global.bulletAvailable = true


