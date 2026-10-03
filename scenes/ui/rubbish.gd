extends Control

@onready var rubbish_icon = $canvas/rubbishIcon

func _ready()->void:
	visible=false

func _process(_delta: float) -> void:
	if Globals.garbage_mode_on:
		visible=true
	else:
		visible=false
