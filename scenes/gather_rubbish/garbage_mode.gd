extends Node2D

@export var rubbish_item:PackedScene

func start()->void:
	if Globals.garbage_mode_on:
		return
	else:
		spawn_items()
		Globals.garbage_mode_on=true

func spawn_items()->void:
	print("STARTED")
	for i in 9:
		print("ADDED ONE RUBBISH")
		add_child(rubbish_item.instantiate())
