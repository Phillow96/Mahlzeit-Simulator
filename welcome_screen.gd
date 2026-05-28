extends Control


func _on_line_edit_text_submitted(new_text: String) -> void:
	GameManager.PLAYER_NAME = new_text
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
