extends Label

func _process(delta):
	if Global.rapidfirepu == true:
		self.text = "MAX BULLETS"
	else:
		self.text = str(Global.clonecurrentBullet)
