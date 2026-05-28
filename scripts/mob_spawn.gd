extends Node2D

@export var enemy_scene: PackedScene

var spawn_point


func _on_mob_timer_timeout() -> void:
	var mob_spawn_location = get_node("../Path2D/PathFollow2D")
	mob_spawn_location.progress_ratio = randf()
	
	var enemy = enemy_scene.instantiate()
	enemy.initialize(GameManager.PLAYER_POSITION)
	enemy.position = mob_spawn_location.position
	
	add_child(enemy)
