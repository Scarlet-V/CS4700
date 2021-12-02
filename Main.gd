extends Node

var score
var wave = preload("res://Wave.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Main")
	randomize()
	new_game()
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	if Global.playerHealth <= 0:
		game_over()
	
	
func game_over():
	Global.reset()
	get_tree().change_scene("res://GameOver.tscn")
	Global.playerHealth = Global.playerMaxHealth
	Global.currentLevel = 1
	Global.playerScore = 0
	Global.currentBullet = 1
	var bulletAvailable = true
	Global.enemyMS = 100
	
func new_game():
	$Player.position = ($PlayerStartPosition.position)
	$Wave.position = ($WaveStartPosition.position)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Wave_cleared(node):
	#Get rid of old empty wave
	node.queue_free()
	#Create a new wave node
	var new_wave = wave.instance()
	#Name it wave so that it can be referenced by $Wave maybe??
	new_wave.set_name("Wave")
	#Move it to the correct starting position after moving the starting position a little closer
	#$WaveStartPosition.position.y += 30
	new_wave.position = $WaveStartPosition.position
	#Connect the wave cleared signal of the new node to this function
	new_wave.connect("cleared", self, "_on_Wave_cleared")
	#Add the new wave node to the Main scene
	Global.shooterHP = Global.shootermaxHP
	Global.blocker1HP = Global.blocker1maxHP
	Global.blocker2HP = Global.blocker2maxHP
	
	if Global.currentLevel % 3 == 0:
		Global.shootermaxHP += 1
		Global.blocker1maxHP += 1
		Global.blocker2maxHP += 1
		Global.enemyMS += 100
		
	add_child(new_wave)

func _on_Master_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),value)
	pass 
