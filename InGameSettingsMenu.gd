extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


func _on_Resume_pressed():
	get_tree().change_scene("res://Main.tscn")
	var bulletAvailable = true


func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Menu.tscn")
	Global.playerHealth = Global.playerMaxHealth
	Global.currentLevel = 1
	Global.playerScore = 0
	var bulletAvailable = true


func _on_Audio_pressed():
	get_tree().change_scene("res://Audio.tscn")
	Global.playerHealth = Global.playerMaxHealth
	Global.currentLevel = 1
	Global.playerScore = 0
	var bulletAvailable = true
