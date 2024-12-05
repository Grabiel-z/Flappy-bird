extends Node2D
var velocity = 210

func _ready() -> void:
	position.x = 320

	# Calcula la nueva posición Y con transiciones suaves
	var new_y = Global.last_pipe_y + randi_range(-80, 80) # Cambia con un rango limitado
	# Asegura que esté dentro de un rango lógico para evitar extremos abruptos
	position.y = clamp(new_y, 220, 380) # Ajusta los límites según tu ventana

	# Actualiza la última posición registrada para la próxima tubería
	Global.last_pipe_y = position.y


func _process(delta: float) -> void:
	position.x -=delta * velocity


func _on_visible_on_screen_delete() -> void:
	queue_free()


func _on_pipeline_bird(body: Node2D) -> void:
	if body is Bird:
		Global.game_over()
		$AudioGameOver.play()
func _on_area_add_point_body_entered(body: Node2D) -> void:
	if body is Bird:
		Global.increase_Score()
		$AudioScore.play()
