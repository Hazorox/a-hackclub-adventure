extends Control

func _on_continue_pressed() -> void:
	DebuggingQuestions.correct_answers = 0
	get_parent().get_parent().queue_free() 
