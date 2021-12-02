extends Node2D

func kill():
	if get_tree().get_current_scene().get_name() == "Main":
		Global.bulletAvailable = true
