extends Control

@onready var rubbish_icon = $canvas/rubbishIcon
@onready var hands_label =$hands_trash
func _ready()->void:
	visible=false

func _process(_delta: float) -> void:
	rubbish_icon.visible = Globals.rubbish_in_hand
	hands_label.visible = Globals.rubbish_in_hand
	visible = Globals.garbage_mode_on
