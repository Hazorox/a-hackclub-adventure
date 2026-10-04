extends Control

func _on_exit_pressed() -> void:
	DebuggingQuestions.correct_answers = 0
	get_parent().get_parent().queue_free()
