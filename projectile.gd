extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = get_global_mouse_position()
	
	position += direction * 0.5 * delta
