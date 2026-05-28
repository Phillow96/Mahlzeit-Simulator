extends Area2D

@export var speed: float

var mood: String = "Neutral"

var timerTime: int
var currentTime: int
var in_range: bool
var walk_away: bool

var rand_x: float
var rand_y: float

func _ready() -> void:
	$Timers.hide()
	
func _physics_process(delta: float) -> void:
	if walk_away:
		chase(rand_x, rand_y, delta) 
	else:
		chase(GameManager.PLAYER_POSITION.x, GameManager.PLAYER_POSITION.y, delta)
	
	
func initialize(player_pos: Vector2):
	look_at(player_pos)
	
	


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space") and in_range and $Timers/EnemyMahlzeitLabel.visible:
		$Timers.hide()
		$EnemyMahlzeitLabelTimer.stop()
		GameManager.SCORE += 1


func _on_enemy_mahlzeit_label_timer_timeout() -> void:
	GameManager.HEALTH -= 1
	

func chase(pos_x: float, pos_y: float, delta):
	position.x += (pos_x - position.x) * delta
	position.y += (pos_y - position.y) * delta


func _on_mob_walk_off_timer_timeout() -> void:
	walk_away = true
	
	rand_x = randf_range(-500,500)
	rand_y = randf_range(-500,500)

func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("projectile")):
		area.call_deferred("queue_free")
		call_deferred("queue_free")
		GameManager.SCORE += 1

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		GameManager.HEALTH -= 1
		queue_free()
		
	
