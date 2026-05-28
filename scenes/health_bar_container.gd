extends HBoxContainer



func _ready() -> void:
	GameManager.player_hit.connect(_on_player_hit)
	
	for i in range($"..".HEALTH):
		var color_rect = ColorRect.new()
		color_rect.color = Color.GREEN
		color_rect.custom_minimum_size = Vector2(10,10)
		add_child(color_rect)
		
		
func _on_player_hit():
	var color_rect = $".".get_child(GameManager.HEALTH)
	color_rect.color = Color.RED
	
