extends Node
@export var pipes_runs_scene: PackedScene

func _ready() -> void:
	$TimerPipes.start()

func create_pipes():
	var pipes_game = pipes_runs_scene.instantiate()
	add_child(pipes_game)


func _on_timer_pipes_timeout() -> void:
	create_pipes()
