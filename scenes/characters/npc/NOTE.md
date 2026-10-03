# NPC USAGE
- NPC Number : Provide a number for the npc variation, check res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split
- on_interact : provide a script for interaction with the player in the following format
```gd
export RefCounted
func run(npc:CharacterBody2d,player:CharacterBody2D):
	pass
```
- on_near (ONLY IF ON_INTERACT IS NULL) : provide the same script structure of the on_interact
