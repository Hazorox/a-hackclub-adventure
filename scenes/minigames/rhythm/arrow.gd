extends Area2D

@onready var arrow: Area2D = $"."

var speed : int
var arrow_rotations: Array
var arrow_direction: int
var rand_arrow_rotations:int
var in_down_area: bool = false  
var in_up_area: bool = false  
var in_right_area: bool = false 
var in_left_area: bool = false 

func _ready() -> void:
	random_direction_generator()
	arrow.rotate(deg_to_rad(rand_arrow_rotations))
	if rand_arrow_rotations == 90:
		arrow_direction = 1
		position = Vector2(815, -100)
	elif rand_arrow_rotations == 270:
		arrow_direction = 3
		position = Vector2(1100, -100)
	elif rand_arrow_rotations == 180:
		arrow_direction = 2
		position = Vector2(505, -100)
	elif rand_arrow_rotations == 0:
		arrow_direction = 0
		position = Vector2(200, -100)

func _process(delta: float) -> void:
	var var_speed = randi_range(500, 750)
	position += Vector2(0, var_speed) * delta
	if in_down_area and Input.is_action_just_pressed("down_arrow"):
		queue_free()
		Globals.rhythem_score += 1
	elif in_up_area and Input.is_action_just_pressed("up_arrow"):
		queue_free()
		Globals.rhythem_score += 1
	elif in_right_area and Input.is_action_just_pressed("right_arrow"):
		queue_free()
		Globals.rhythem_score += 1
	elif in_left_area and Input.is_action_just_pressed("left_arrow"):
		queue_free()
		Globals.rhythem_score += 1

func random_direction_generator() -> void:
	arrow_rotations =[0, 90, 180, 270]
	rand_arrow_rotations = arrow_rotations.pick_random()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("down_arrow"):   
		in_down_area = true
	elif area.is_in_group("up_arrow"):   
		in_up_area = true
	elif area.is_in_group("left_arrow"):   
		in_left_area = true
	elif area.is_in_group("right_arrow"):   
		in_right_area = true

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("down_arrow"):   
		in_down_area = false
	elif area.is_in_group("up_arrow"):   
		in_up_area = false
	elif area.is_in_group("left_arrow"):   
		in_left_area = false
	elif area.is_in_group("right_arrow"):   
		in_right_area = false
