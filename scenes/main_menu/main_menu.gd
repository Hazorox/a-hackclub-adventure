extends Control

@onready var buttons :Array[Button] = [$vsplit/Button,$vsplit/Button3]

func _ready()->void:
	buttons[0].pressed.connect(on_start_pressed)
	buttons[1].pressed.connect(on_opt_pressed)

func on_opt_pressed()->void:
	get_tree().change_scene_to_file("res://scenes/options/options.tscn")

func on_start_pressed()->void:
	get_tree().change_scene_to_file("res://scenes/main_game/game.tscn")
