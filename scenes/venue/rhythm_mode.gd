extends Node2D

var rhythm_scene : PackedScene = preload("res://scenes/minigames/rhythm/rhythm.tscn")
var layer : CanvasLayer = null
var finished := false

func start() -> void:
	if layer != null or finished:
		return
	layer = CanvasLayer.new()
	layer.layer = 100
	add_child(layer)
	var rhythm : Node = rhythm_scene.instantiate()
	layer.add_child(rhythm)
	rhythm.tree_exited.connect(func():
		layer.queue_free()
		layer = null
		finished = true)
