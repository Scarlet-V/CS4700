extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Resume_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Audio_pressed():
	get_tree().change_scene("res://Audio.tscn")
