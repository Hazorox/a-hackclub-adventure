extends Control

@onready var code_edit: CodeEdit = $MarginContainer/CodeEdit
@onready var choice_a: Button = $"Choice A"
@onready var choice_b: Button = $"Choice B"
@onready var choice_c: Button = $"Choice C"

func _ready() -> void:
	code_edit.text = """extends CharacterBody2D

const SPEED := 300

func _ready() -> void:
	var direction := Input.get_input_vector("left", "right", "up", "down")
	velocity = SPEED * direction
	#Which one is the missing function?"""
	
	choice_a.text = "move_and_slide()"
	choice_b.text = "move_and_collide(velocity)"
	choice_c.text = "set_velocity(direction)"

func _process(_delta: float) -> void:
	if DebuggingQuestions.correct_answers == 0: 
		print(DebuggingQuestions.correct_answers)

func _on_choice_a_pressed() -> void:
	if DebuggingQuestions.correct_answers == 0:
		DebuggingQuestions.correct_answers += 1

func _on_choice_b_pressed() -> void:
	pass # Replace with function body.

func _on_choice_c_pressed() -> void:
	pass # Replace with function body.
