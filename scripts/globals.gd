extends Node

var rhythem_score : int = 0

var objective := {"title":"first_talk","description":"Strike up a talk with someone"}

var rubbish_in_hand :=false
var rubbish_score := 0
var garbage_mode_on :=false
var friends = 0
var caffeine_on := false
func _process(_delta:float)->void:
	if rubbish_score==10:
		garbage_mode_on=false
