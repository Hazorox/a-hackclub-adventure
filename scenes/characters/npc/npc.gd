extends CharacterBody2D

# To determine the sprite sheet to use
@export var npc_number:int=2
@export var on_interact:GDScript
@export var once_near:GDScript

# sprite and interaction_area
@onready var sprite:AnimatedSprite2D =$AnimatedSprite2D
@onready var interaction_area:Area2D = $interaction

# Sprite Sheet constants
const frame_size = Vector2i(16,20)
const animations := ["down","left","right","up"]
const sheet_name := "character_%s_frame16x20.png"
const NPC_FOLDER := "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_"
const fps = 5.0

# Script vars
var once_near_ran :bool = false
var player_in_range :CharacterBody2D = null
var interactable := false

# Listen for area and build sprite frames
func _ready()->void:
	interaction_area.area_entered.connect(interaction_entered)
	interaction_area.area_exited.connect(interaction_exited)
	sprite.sprite_frames = build_frames(load(NPC_FOLDER+str(npc_number)+"/"+sheet_name % str(npc_number)))
	
	# Play one frame of down and stop to mimic idle
	sprite.play("down")
	sprite.stop()

func _process(_delta:float)->void:
	
	# Run once_near one time once player approaches
	if interactable and once_near !=  null and not once_near_ran:
		once_near.new().run(self,player_in_range)
		once_near_ran = true
		return
	
	# Run interact if once_near is done and player pressed "interact"
	if Input.is_action_just_pressed("interact") and interactable and on_interact != null:
		print("INTERACTED")
		on_interact.new().run(self,player_in_range)


# Building spriteframes from sheet
func build_frames(sheet:Texture2D)->SpriteFrames:
	
	# Initialzing sheet and removing leftover default animation
	var frames := SpriteFrames.new()
	frames.remove_animation("default")
	
	# looping over rows of animations, 4 primary rows
	for row in range(len(animations)):
		
		# Creating the animation
		var anim_name = animations[row]
		frames.add_animation(anim_name)
		frames.set_animation_speed(anim_name,fps)
		
		# Fetching animation by loading the AtlasTexture and fetching the set of desired columns:3 in the same row
		for col in range(3):
			var texture = AtlasTexture.new()
			texture.atlas = sheet
			texture.region = Rect2(col*frame_size.x,row*frame_size.y,frame_size.x,frame_size.y)
			
			# Adding the frames to the animation
			frames.add_frame(anim_name,texture)
	
	return frames

# Registering interactable
func interaction_entered(area:Area2D):
	if area.is_in_group("player_interaction"):
		player_in_range = area.get_parent()
		interactable=true

# Removing interactable
func interaction_exited(area:Area2D):
	if area.is_in_group("player_interaction"):
		interactable = false
		player_in_range = null
