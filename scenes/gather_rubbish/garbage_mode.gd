extends Node2D

# Defining constants for the dialog
const sprite_full = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_26/Ellie.png"
const audio_path = "res://assets/audio/dialog_sound.wav"
const npc_name = "Ellie"

# Insitantiating rubbish item packed scene to copy
@export var rubbish_item:PackedScene

# Accessing Dialog Sibling Node or smth
@export var dialog:Node

func start()->void:
	# Dialog logic
	dialog.queue_text("Hey!!, This place is starting to get messy...",sprite_full,npc_name,audio_path)
	dialog.queue_text("I think we should clean it up a bit",sprite_full,npc_name,audio_path)
	dialog.queue_text("Can you help ?",sprite_full,npc_name,audio_path)
	dialog.queue_choice(["Help","Act dumb and ignore"],sprite_full,npc_name,player_chose)
	
	# Updating the objective
	Globals.objective.title = "rubbish"
	Globals.objective.description = "Help clean up the event space"

func spawn_items()->void:
	# Add 10 rubbish items
	for i in 10:
		add_child(rubbish_item.instantiate())

func player_chose(choice:int)->void:
	# Choice 0 : Help ... Choice 1 : Ignore
	if choice==0:
		# If gamemode is already on, or caffine mode, cancel
		if Globals.garbage_mode_on or Globals.caffeine_on:
			return
		else:
			# Spawn and start game mode
			spawn_items()
			Globals.garbage_mode_on=true
