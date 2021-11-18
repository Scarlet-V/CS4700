extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_Variant_pressed():
	get_tree().change_scene("res://Variant.tscn")


func _on_Settings_pressed():
	get_tree().change_scene("res://MenuSettings.tscn")
	
