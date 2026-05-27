extends Label


func _process(_delta: float) -> void:
	text = "Health: %s" % GameManager.HEALTH
