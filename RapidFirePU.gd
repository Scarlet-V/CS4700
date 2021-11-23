extends Area2D

var move_speed = 300
var i

func _physics_process(delta):
	position.y += move_speed * delta


func _on_RapidFirePU_body_entered(body):
	#if Global.rapidfirepu == true:
		if body.name == "Player":
			Global.currentBullet += 10
			print(Global.currentBullet,Global.maxBullet)
			i = 10
			for i in range(0,10):
				Global.currentBullet -=1
				yield(get_tree().create_timer(1),"timeout")
				print(Global.currentBullet,Global.maxBullet)
			#Global.rapidfirepu = false
			#Global.maxBullet += 1
			#Global.currentBullet = 1
			queue_free()


func _on_Timer_timeout():
	print("TO")
	Global.rapidfirepu = false
