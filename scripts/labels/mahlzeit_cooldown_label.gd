extends Label


func _process(_delta: float) -> void:
	text = "%.2f" % $"../MahlzeitDisplay".time_left
