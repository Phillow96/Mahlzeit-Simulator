extends Label

var test: String

func _process(_delta: float) -> void:
	text = "Time left: %.2f" % update()

func _on_enemy_mahlzeit_label_timer_ready() -> void:
	test = "Time left: %.2f" % ($"../../EnemyMahlzeitLabelTimer".time_left)
	
func update() -> float:
	return $"../../EnemyMahlzeitLabelTimer".time_left
