extends Node2D

# Define dialog constants ( why didn't Adham give default values for the function fr T-T )
const sprite_path := "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_20/Chris.png"
const npc_name = "Chris"
const audio_path := "res://assets/audio/dialog_sound.wav"

# Get dialog node from venue.tscn to access
@export var dialog:Node

# give text then prompt choice
func start()->void:
	dialog.queue_text("You seem to be getting tired, need some caffeine ?",sprite_path,npc_name,audio_path)
	dialog.queue_choice(["Maybe..Yeah","No, Thanks for Offering"],sprite_path,npc_name,player_chose)

func player_chose(choice:int)->void:
	# Choice 0 : get caffeine, 1 : ignore
	if choice==0:
		
		# If already on, passssssss
		if Globals.caffeine_on:
			return
		else:
			# Show text
			dialog.queue_text("Alright, you now have 25 seconds to get caffeine from near the water dispenser",sprite_path,npc_name,audio_path)
			
			# Update Objective
			Globals.objective.title = "caffeine"
			Globals.objective.description = "Go get caffeine ASAP"
			
			# Start caffeine game mode
			Globals.caffeine_on = true
			Globals.start_caffeine_timer()
			Globals.caffeine_in_time = true
	else:
		# Refused, greet and bye
		dialog.queue_text("Alright, enjoy a healthy life ;) ",sprite_path,npc_name,audio_path)
