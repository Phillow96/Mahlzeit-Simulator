extends Node2D

@export var enemy_scene: PackedScene
@export var player_scene: PackedScene
@export var projectile_scene: PackedScene

var enemy: Node2D

var punkteCount: int = 0


func _ready() -> void:
	var player = player_scene.instantiate()
	add_child(player)
	GameManager.PLAYER_POSITION = Vector2(0,0)
	player.position = GameManager.PLAYER_POSITION
	
	
func _process(_delta: float) -> void:
	if GameManager.HEALTH <= 0:
		get_tree().quit()


func _on_player_shoot() -> void:
	var projectile = projectile_scene.instantiate()
	add_child(projectile)
	projectile.position = GameManager.PLAYER_POSITION
	
