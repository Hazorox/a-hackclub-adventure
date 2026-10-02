extends Control

@onready var buttons :Array[Button] = [$vsplit/start,$vsplit/opt]
var fullscreen :=false
func _ready()->void:
	buttons[0].pressed.connect(on_start_pressed)

func on_start_pressed()->void:
	get_tree().change_scene_to_file("res://scenes/main_game/game.tscn")
