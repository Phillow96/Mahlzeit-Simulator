extends Control

func _ready() -> void:
	display_highscores()

func load_highscores() -> Array:
	if FileAccess.file_exists("user://highscores.json"):
		var file = FileAccess.open("user://highscores.json", FileAccess.READ)
		var data = JSON.parse_string(file.get_as_text())
		print(data)
		file.close()
		return data
	return []

func display_highscores():
	var highscores = load_highscores()
	for i in range(highscores.size()):
		var entryLabel = Label.new()
		entryLabel.text = ("%d. %s - %d" % [i+1, highscores[i]["name"], highscores[i]["score"]])
		$VBoxContainer.add_child(entryLabel)
		print("%d. %s - %d" % [i+1, highscores[i]["name"], highscores[i]["score"]])	
