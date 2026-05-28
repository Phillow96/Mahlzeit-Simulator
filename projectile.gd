extends Area2D

const SPEED = 5
var direction: Vector2 = Vector2.ZERO

func _ready():
	direction = get_local_mouse_position()

func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
