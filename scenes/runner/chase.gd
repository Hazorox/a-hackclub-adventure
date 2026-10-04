extends CharacterBody2D

const SPEED = 130.0
const CATCH_DISTANCE = 30.0
const GAME_OVER_SCENE = "res://scenes/minigames/debugging_game_over.tscn"

@export var target: Node2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var repath_timer := 0.0
var caught := false

func _ready() -> void:
	if target == null:
		target = get_tree().get_first_node_in_group("player")
	await get_tree().physics_frame

func _physics_process(delta: float) -> void:
	if target == null or caught:
		return

	if global_position.distance_to(target.global_position) < CATCH_DISTANCE:
		caught = true
		get_tree().change_scene_to_file.call_deferred(GAME_OVER_SCENE)
		return

	repath_timer -= delta
	if repath_timer <= 0.0:
		nav.target_position = target.global_position
		repath_timer = 0.15

	var direction: Vector2
	if nav.get_current_navigation_path().size() > 1 and not nav.is_navigation_finished():
		direction = global_position.direction_to(nav.get_next_path_position())
	else:
		direction = global_position.direction_to(target.global_position)

	velocity = direction * SPEED
	move_and_slide()
	update_animation()

func update_animation() -> void:
	if velocity.length() < 1.0:
		sprite.play("idle")
		return

	if abs(velocity.x) > abs(velocity.y):
		sprite.play("right" if velocity.x > 0 else "left")
	else:
		sprite.play("down" if velocity.y > 0 else "up")
