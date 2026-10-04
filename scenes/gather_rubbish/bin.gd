extends Area2D

@export var npc_to_remove : Node

func _ready()->void:
	body_entered.connect(on_body_entered)

func on_body_entered(body:Node2D)->void:
	if body.is_in_group("player") and Globals.rubbish_in_hand :
		Globals.rubbish_in_hand = false
		Globals.rubbish_score +=1
		if Globals.rubbish_score==10:
			if npc_to_remove != null:
				Globals.objective.topic ="wander"
				Globals.objective.description = "Wander Around !!"
				npc_to_remove.queue_free()
