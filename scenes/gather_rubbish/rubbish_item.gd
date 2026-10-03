extends Area2D

@onready var sprite:Sprite2D = $Sprite2D

const textures := ["banana","box 1 dynamic","crumpled paper 1","crumpled paper 2","garbage bag 1","garbage bag 2","water bottle crumpled","water bottle dirty"]

func _ready()->void:
	var new_texture = textures.pick_random()
	sprite.texture = load("res://assets/trash assets/%s.png" % new_texture)
	body_entered.connect(on_body_entered)

func on_body_entered(body:Node2D)->void:
	if body.is_in_group("player") and not Globals.rubbish_in_hand:
		Globals.rubbish_in_hand = true
		queue_free()
