extends Area2D

func _ready()->void:
	body_entered.connect(player_entered)

func player_entered(body:Node2D)->void:
	if body.is_in_group("player"):
		Globals.caffeine_on=false
		Globals.caffeine_in_time=false
		Globals.friends+=1
