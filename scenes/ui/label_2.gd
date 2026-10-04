extends Label

@export var start_time := 60.0   # seconds

var time_left := 0.0
var running := true

signal time_up

func _ready() -> void:
	time_left = start_time
	update_text()

func _process(delta: float) -> void:
	if not running:
		return

	time_left -= delta
	if time_left <= 0.0:
		time_left = 0.0
		running = false
		update_text()
		time_up.emit()
		get_tree().change_scene_to_file("res://scenes/minigames/debugging_winning.tscn")
		return

	update_text()

func update_text() -> void:
	var total := int(ceil(time_left))
	var minutes := total / 60
	var seconds := total % 60
	text = "%d:%02d" % [minutes, seconds]
