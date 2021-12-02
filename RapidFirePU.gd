extends Area2D

var move_speed = 300
var delay = 1;
onready var cooldownTimer := $CooldownTimer

func _physics_process(delta):
	position.y += move_speed * delta

#func _on_RapidFirePU_body_entered(body):
#	var timer = Timer.new()
#	timer.set_wait_time(1.0)
#	# I tried getting this to auto fire for around 
#	# 10 shots with one second in delay
#	# could not get it to work properly
#	if body.name == "Player":
#		start()
		
func _on_RapidFirePU_body_entered(body):
	if body.name == "Player":
		queue_free()
		start()
#   This code should work in theory but it does not reset after rapidfirepu is 
#   false even if i force reset the currentbullet and max bullet

func start():
	print("rapid fire on")
	Global.rapidfirepu = true
	while Global.rapidfirepu == true:
		Global.currentBullet = 1000
		yield(get_tree().create_timer(5),"timeout")
		print("rapid fire on")
		Global.rapidfirepu = false
	Global.currentBullet = Global.maxBullet
