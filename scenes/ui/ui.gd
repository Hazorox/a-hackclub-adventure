extends CanvasLayer
@onready var escape:Control = $escape
@onready var escape_canvas:CanvasLayer = $escape/canvas
func _ready()->void:
	process_mode=Node.PROCESS_MODE_ALWAYS

func _process(_delta:float)->void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == true:
			get_tree().paused = false
			escape.visible = false
			escape_canvas.visible = false
		else:
			get_tree().paused = true
			escape.visible = true
			escape_canvas.visible = true
