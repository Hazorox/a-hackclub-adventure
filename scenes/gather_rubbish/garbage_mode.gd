extends Node2D

@export var rubbish_item:PackedScene

func start()->void:
	Globals.objective.title = "rubbish"
	Globals.objective.description = "Help clean up the event space"
	# Cancel if mode already on
	if Globals.garbage_mode_on:
		return
	else:
		# Spawn and start game mode
		spawn_items()
		Globals.garbage_mode_on=true

func spawn_items()->void:
	# Add 10 rubbish items
	for i in 10:
		add_child(rubbish_item.instantiate())
