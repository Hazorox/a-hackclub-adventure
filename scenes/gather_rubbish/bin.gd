extends Area2D

func _ready()->void:
	body_entered.connect(on_body_entered)

func on_body_entered(body:Node2D)->void:
	print("PLAYER CAME")
	if body.is_in_group("player") and Globals.rubbish_in_hand :
		print("EMPTIED PLAYERS HANDS")
		Globals.rubbish_in_hand = false
		Globals.rubbish_score +=1
