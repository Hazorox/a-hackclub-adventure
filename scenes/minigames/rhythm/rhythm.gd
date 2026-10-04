extends Node2D

@onready var score: Label = $Score

var arrow_scene : PackedScene = preload("res://scenes/minigames/rhythm/arrow.tscn") 
var is_over := false

func _process(_delta: float) -> void:
	score.text = "Score: " + str(Globals.rhythem_score)

func _on_arrow_spawning_timer_timeout() -> void:
	var arrow := arrow_scene.instantiate()
	$FallingArrows.add_child(arrow)

func finish_game() -> void:
	Globals.rhythem_score = 0   # reset for next time
	queue_free()

func _on_lose_detection_area_area_entered(area: Area2D) -> void:
	if area.get_parent() == $FallingArrows:   # only arrows, not other areas
		game_over()

func game_over() -> void:
	if is_over:   # several arrows can enter at once
		return
	is_over = true
	finish_game()
