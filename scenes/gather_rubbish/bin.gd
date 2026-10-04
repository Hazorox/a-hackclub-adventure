extends Area2D

# Will provide Ellie npc to remove from the inspector
@export var npc_to_remove : Node

func _ready()->void:
	body_entered.connect(on_body_entered)

# If the player has rubbish :
func on_body_entered(body:Node2D)->void:
	if body.is_in_group("player") and Globals.rubbish_in_hand :
		
		# Remove rubbish from hand & increase score
		Globals.rubbish_in_hand = false
		Globals.rubbish_score +=1
		
		# If the score reaches 10 (target), change objective, add friend and remove Ellie :(
		if Globals.rubbish_score==10:
			if npc_to_remove != null:
				Globals.objective.topic ="wander"
				Globals.objective.description = "Wander Around !!"
				Globals.garbage_mode_on=false
				Globals.friends +=1
				npc_to_remove.queue_free()
