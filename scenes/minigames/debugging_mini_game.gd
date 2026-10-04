extends Control

@onready var code_edit: CodeEdit = $MarginContainer/CodeEdit
@onready var choice_a: Button = $"Choice A"
@onready var choice_b: Button = $"Choice B"
@onready var choice_c: Button = $"Choice C"

var text_0 :=  """extends CharacterBody2D

const SPEED := 300

func _process() -> void:
	var direction := Input.get_input_vector("left", "right", "up", "down")
	velocity = SPEED * direction
	#Answer"""

var text_1 := """extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity.y += 900 * delta
	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = #Answer"""

var text_2 := """extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	velocity.x = direction * 200
	move_and_slide()

	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = #Answer"""

var text_3 := """extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	print("Coin collected!")
	#Answer"""

var text_4 := """extends Node

func _ready() -> void:
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 2.0
	timer.timeout.connect(_on_timeout)
	timer.#Answer()

func _on_timeout() -> void:
	print("Time's up!")"""

var text_5 := """extends Node

var score := 0

@onready var label: Label = $Label

func add_point() -> void:
	score += 1
	label.text = #Answer(score)"""

var text_6 := """extends Node

signal died

var health := 100

func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		died.#Answer()""" 

var text_7 := """extends Sprite2D

func _process(delta: float) -> void:
	#Answer(get_global_mouse_position())"""

var text_8 := """extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	position.x += direction * 300 * delta
	position.x = #Answer(position.x, 0.0, 1000.0)"""

var text_9 := """extends Node

func _ready() -> void:
	print("Starting...")
	#Answer get_tree().create_timer(2.0).timeout
	print("2 seconds later")"""

func _ready() -> void:
	code_edit.text = text_0
	choice_a.text = "move_and_slide()"
	choice_b.text = "move_and_collide(velocity)"
	choice_c.text = "set_velocity(direction)"

func _process(_delta: float) -> void:
	change_choices()
	if DebuggingQuestions.correct_answers == 10:
		print("you've won")

func _on_choice_a_pressed() -> void:
	if DebuggingQuestions.correct_answers == 0:
		DebuggingQuestions.correct_answers += 1
	elif DebuggingQuestions.correct_answers == 4:
		DebuggingQuestions.correct_answers += 1
	elif DebuggingQuestions.correct_answers == 5:
		DebuggingQuestions.correct_answers += 1
	elif DebuggingQuestions.correct_answers == 9:
		DebuggingQuestions.correct_answers += 1
	else:
		print("you've lost")

func _on_choice_b_pressed() -> void:
	if DebuggingQuestions.correct_answers == 2:
		DebuggingQuestions.correct_answers += 1
	elif DebuggingQuestions.correct_answers == 6:
		DebuggingQuestions.correct_answers += 1
	elif DebuggingQuestions.correct_answers == 8:
		DebuggingQuestions.correct_answers += 1
	else:
		print("you've lost")

func _on_choice_c_pressed() -> void:
	if DebuggingQuestions.correct_answers == 1:
		DebuggingQuestions.correct_answers += 1
	elif DebuggingQuestions.correct_answers == 3:
		DebuggingQuestions.correct_answers += 1
	elif DebuggingQuestions.correct_answers == 7:
		DebuggingQuestions.correct_answers += 1
	else:
		print("you've lost")

func change_choices() -> void:
	if DebuggingQuestions.correct_answers == 1: 
		code_edit.text = text_1
		choice_a.text = "900"
		choice_b.text = "delta"
		choice_c.text = "-400"
	elif DebuggingQuestions.correct_answers == 2: 
		code_edit.text = text_2
		choice_a.text = "true"
		choice_b.text = "false"
		choice_c.text = "null"
	elif  DebuggingQuestions.correct_answers == 3:
		code_edit.text = text_3
		choice_a.text = "destroy()"
		choice_b.text = "delete()"
		choice_c.text = "queue_free()"
	elif  DebuggingQuestions.correct_answers == 4:
		code_edit.text = text_4
		choice_a.text = "start"
		choice_b.text = "begin"
		choice_c.text = "run"
	elif  DebuggingQuestions.correct_answers == 5:
		code_edit.text = text_5
		choice_a.text = "str"
		choice_b.text = "text"
		choice_c.text = "print"
	elif  DebuggingQuestions.correct_answers == 6:
		code_edit.text = text_6
		choice_a.text = "fire"
		choice_b.text = "emit"
		choice_c.text = "call"
	elif  DebuggingQuestions.correct_answers == 7:
		code_edit.text = text_7
		choice_a.text = "face_to"
		choice_b.text = "turn_to"
		choice_c.text = "look_at"
	elif  DebuggingQuestions.correct_answers == 8:
		code_edit.text = text_8
		choice_a.text = "limit"
		choice_b.text = "clamp"
		choice_c.text = "bound"
	elif  DebuggingQuestions.correct_answers == 9:
		code_edit.text = text_9
		choice_a.text = "await"
		choice_b.text = "wait"
		choice_c.text = "delay"
