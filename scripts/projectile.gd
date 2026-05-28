extends Area2D

const SPEED = 200
var direction = Vector2.ZERO


func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
