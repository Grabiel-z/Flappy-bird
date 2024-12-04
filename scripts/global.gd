extends Node
signal on_increase_score
var score := 0
func increase_Score():
	score +=1
	emit_signal("on_increase_score")
func game_over():
	get_tree().paused=true
