extends CanvasLayer
func _ready() -> void:
	Global.connect("on_increase_score", change_score)
	Global.connect("on_game_over_owo", game_over)
	$Gameover.hide()
	$Message.show()
	get_tree().paused = false
func _input(event: InputEvent) -> void:
	# Detectar teclas o botones para iniciar el juego
	if Input.is_action_just_pressed("ui_accept"):
		if not Global.is_start:
			start_game()

	# Detectar toques de pantalla para iniciar el juego
	elif event is InputEventScreenTouch and event.pressed:
		if not Global.is_start:
			start_game()

	# Detectar clics del ratón como emulación de toques
	elif event is InputEventMouseButton and event.pressed:
		if not Global.is_start:
			start_game()

func start_game():
	# Iniciar el juego
	Global.game_start()
	game_start()
func game_start():
	$Message.hide()
func game_over():
	$Gameover.show()
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()
func change_score():
	$LabelScore.text=str(Global.score)
