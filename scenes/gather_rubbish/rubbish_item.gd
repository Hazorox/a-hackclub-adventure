extends Area2D

@onready var sprite:Sprite2D = $Sprite2D

# Define texture file names and node position ranges
const textures := ["banana","box 1 dynamic","crumpled paper 1","crumpled paper 2","garbage bag 1","garbage bag 2","water bottle crumpled","water bottle dirty"]
const min_pos := Vector2(20,20)
const max_pos := Vector2(1260,700)

# Booleans for the random position generating logic
var found_place :=false
var hit_round :=false

# Generate random texture, connect event listeners and reserve a spot for spawn
func _ready()->void:
	var new_texture = textures.pick_random()
	sprite.texture = load("res://assets/trash assets/%s.png" % new_texture)
	body_entered.connect(on_body_entered)
	area_entered.connect(on_body_entered)
	_find_available_place()

# Delete if the player collides with. Otherwise, remark that this spot is taken by another object
func on_body_entered(body:Node2D)->void:
	if body.is_in_group("player") and not Globals.rubbish_in_hand:
		Globals.rubbish_in_hand = true
		queue_free()
	else:
		hit_round = true

# Keep randomizing global_pos untill found_place is true
func _find_available_place()->void:
	while not found_place:
		hit_round = false
		global_position = Vector2(
			randf_range(min_pos.x,max_pos.x),
			randf_range(min_pos.y,max_pos.y)
		)
		
		# Got some help from claude for detecting if the item overlaps with any using the following :
		await get_tree().physics_frame
		await get_tree().physics_frame
		if not hit_round:
			found_place = true
