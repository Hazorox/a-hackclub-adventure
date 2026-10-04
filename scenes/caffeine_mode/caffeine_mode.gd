extends Node2D

const sprite_path := "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_20/Chris.png"
const npc_name = "Chris"
const audio_path := "res://assets/audio/dialog_sound.wav"
@export var dialog:Node

func start()->void:
	dialog.queue_text("You seem to be getting tired, need some caffeine ?",sprite_path,npc_name,audio_path)
	dialog.queue_choice(["Maybe..Yeah","No, Thanks for Offering"],sprite_path,npc_name,player_chose)

func player_chose(choice:int)->void:
	if choice==0:
		if Globals.caffeine_on:
			return
		else:
			Globals.caffeine_on = true
			# Start Caffeine Mode
	else:
		dialog.queue_text("Alright, enjoy a healthy life ;) ",sprite_path,npc_name,audio_path)
