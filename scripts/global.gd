extends Node
signal on_increase_score
signal on_game_start_owo
signal on_game_over_owo
var score := 0
var is_start:= false
var last_pipe_y = 256 # Posición inicial razonable

func game_start():
	is_start = true
	score = 0
	last_pipe_y = 256 # Reinicia la posición inicial de las tuberías
	emit_signal("on_increase_score")
	emit_signal("on_game_start_owo")

func increase_Score():
	score +=1
	emit_signal("on_increase_score")
func game_over():
	is_start = false
	get_tree().paused = true
	emit_signal("on_game_over_owo")
