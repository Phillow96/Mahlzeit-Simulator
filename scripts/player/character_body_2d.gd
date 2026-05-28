extends CharacterBody2D

signal take_damage
signal shoot

@export var SPEED: float
@export var HEALTH: int = 5

var player_safe: bool
var mahlzeit_cd: bool

func _ready():
	GameManager.HEALTH = HEALTH
	position = Vector2(0,0)
	$Sprite2D.play("idle")
	
	
func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	input_vector = input_vector.normalized()
	velocity = input_vector * SPEED
	move_and_slide()

	# Animation only changes when direction changed
	if input_vector == Vector2.ZERO:
		$Sprite2D.play("idle")
	else:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				$Sprite2D.play("right")
			else:
				$Sprite2D.play("left")
		else:
			if input_vector.y > 0:
				$Sprite2D.play("down")
			else:
				$Sprite2D.play("up")

	if Input.is_action_pressed("space") and mahlzeit_cd == false:
		GameManager.player_shot.emit()
		mahlzeit_cd = true
		$Control/MahlzeitDisplay.start()
		$Control/MahlzeitCooldownLabel.show()
		
func _process(_delta: float) -> void:
	GameManager.PLAYER_POSITION = position


func _on_mahlzeit_display_timeout() -> void:
	mahlzeit_cd = false
	$Control/MahlzeitCooldownLabel.hide()
