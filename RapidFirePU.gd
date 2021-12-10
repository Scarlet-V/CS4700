extends Area2D

var move_speed = 300
var delay = 1;
#onready var cooldownTimer := $CooldownTimer

func _physics_process(delta):
	position.y += move_speed * delta


		
func _on_RapidFirePU_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.rapidfirepu = true

#func start():
#	#Global.currentBullet = 1000
#	yield(get_tree().create_timer(1),"timeout")
#	print("rapid fire off")
#	Global.rapidfirepu = false
#	print("rapid fire off")

#func start():
#	print("rapid fire on")
#	Global.rapidfirepu = true
#	var tempScore = Global.playerScore
#	while Global.rapidfirepu == true:
#		#Global.currentBullet = 1000
#		print("TEMP")
#		print(tempScore + 100)
#		print(Global.playerScore)
#		if (tempScore + 100) < Global.playerScore:
#			Global.rapidfirepu = false;
#			print("rapid fire off")
#	Global.currentBullet = Global.maxBullet
