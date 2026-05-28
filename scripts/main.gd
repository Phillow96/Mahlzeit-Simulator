extends Node2D

@export var enemy_scene: PackedScene
@export var player_scene: PackedScene
@export var projectile_scene: PackedScene

var enemy: Node2D
var player: Node2D

var punkteCount: int = 0


func _ready() -> void:
	GameManager.player_shot.connect(_on_player_shoot)
	$GameOver/CanvasLayer.visible = false
	player = player_scene.instantiate()
	add_child(player)
	GameManager.PLAYER_POSITION = Vector2(0,0)
	player.position = GameManager.PLAYER_POSITION
	
	
func _process(_delta: float) -> void:
	if GameManager.HEALTH <= 0:
		$GameOver/CanvasLayer.visible = true


func _on_player_shoot() -> void:
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
	projectile.position = player.position
	projectile.direction = (get_global_mouse_position() - player.position).normalized()


func _on_replay_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_end_game_button_pressed() -> void:
	get_tree().quit()
