extends Label


func _process(delta: float) -> void:
	text = "%.2s" % $"../MahlzeitDisplay".time_left
