extends CharacterBody2D

# To determine the sprite sheet to use
@export var npc_number:int=2
@export var on_interact:GDScript
@export var once_near:GDScript

@onready var sprite:AnimatedSprite2D =$AnimatedSprite2D

const frame_size = Vector2i(16,20)
const animations := ["down","left","right","up"]
const sheet_name := "character_%s_frame16x20.png"
const NPC_FOLDER := "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_"
const fps = 5.0

func _ready()->void:
	sprite.sprite_frames = build_frames(load(NPC_FOLDER+str(npc_number)+"/"+sheet_name % str(npc_number)))
	sprite.play("down")
	sprite.stop()
	
func build_frames(sheet:Texture2D)->SpriteFrames:
	var frames := SpriteFrames.new()
	for row in range(len(animations)):
		var anim_name = animations[row]
		frames.add_animation(anim_name)
		frames.set_animation_speed(anim_name,fps)
		for col in range(3):
			var texture = AtlasTexture.new()
			texture.atlas = sheet
			texture.region = Rect2(col*frame_size.x,row*frame_size.y,frame_size.x,frame_size.y)
			frames.add_frame(anim_name,texture)
	return frames
