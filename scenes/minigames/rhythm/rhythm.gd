extends Node2D

@onready var score: Label = $Score

var arrow_scene : PackedScene = preload("res://scenes/minigames/rhythm/arrow.tscn") 

func _process(_delta: float) -> void:
	score.text = "Score: " + str(Globals.rhythem_score)

func _on_arrow_spawning_timer_timeout() -> void:
	var arrow := arrow_scene.instantiate()
	$FallingArrows.add_child(arrow)
