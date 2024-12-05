extends Node
@export var pipes_runs_scene: PackedScene
func _ready() -> void:
	Global.connect("on_game_start_owo", game_start)
func game_start():
	$TimerPipes.start()
func create_pipes():
	var pipes_game = pipes_runs_scene.instantiate()
	add_child(pipes_game)
func _on_timer_pipes_timeout() -> void:
	create_pipes()
func _on_area_floor_body_entered(body: Node2D) -> void:
	if body is Bird:
		Global.game_over()
		$TimerPipes.stop()
		$AudioGameOver.play()
