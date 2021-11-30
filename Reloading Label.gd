extends Label

func _process(delta):
	if Global.bulletAvailable == false:
		self.text = "Reloading..."
	else:
		self.text = ""
