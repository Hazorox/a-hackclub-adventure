extends Control

func _on_continue_pressed() -> void:
	Globals.rhythem_score = 0
	get_parent().finish_game()
