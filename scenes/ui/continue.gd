extends Button
@onready var parent = get_parent().get_parent().get_parent()
@onready var canvas = get_node("../../../canvas")
func _ready()->void:
	pressed.connect(pressed_continue)

func pressed_continue()->void:
	parent.visible=false
	canvas.visible=false
	get_tree().paused=false
