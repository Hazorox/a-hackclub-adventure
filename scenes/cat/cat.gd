extends CharacterBody2D

const TELE = 300.0
const DIST = 50.0
const TOL = 10.0
const SPEED = 150.0
@export var target: CharacterBody2D
@onready var nav: NavigationAgent2D  = $NavigationAgent2D2
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var reapth_timer = 0.0

func _ready() -> void:
	await get_tree().physics_frame

func _physics_process(delta: float) -> void:
	if target == null:
		return
		
	var to_target = target.global_position - global_position
	var dist = to_target.length()
	var dir = to_target.normalized()
	
	if dist > TELE:
		tele()
		return
	
	if dist > DIST+TOL:
		reapth_timer -= delta
		if reapth_timer <= 0.0:
			nav.target_position = target.global_position
			reapth_timer = 0.2
		if nav.is_navigation_finished():
			velocity = Vector2.ZERO
		else:
			var next_point = nav.get_next_path_position()
			velocity = global_position.direction_to(next_point) * SPEED
		$AnimatedSprite2D.play("running")
	elif dist < DIST-TOL:
		velocity = -dir * SPEED * 0.6
		$AnimatedSprite2D.play("running", -0.6)
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
	
	if abs(to_target.x) > 1.0:
		$AnimatedSprite2D.flip_h = to_target.x < 0
		
	
	move_and_slide()

func tele():
	var wanted = target.global_position + Vector2(-DIST, 0)
	var map = nav.get_navigation_map()
	global_position = NavigationServer2D.map_get_closest_point(map, wanted)
	velocity = Vector2.ZERO
