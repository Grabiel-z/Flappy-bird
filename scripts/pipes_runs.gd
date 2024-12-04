extends Node2D
var velocity = 400

func _ready() -> void:
	position.x = 320
	position.y = randi_range(192,416)

func _process(delta: float) -> void:
	position.x -=delta * velocity


func _on_visible_on_screen_delete() -> void:
	queue_free()


func _on_pipeline_bird(body: Node2D) -> void:
	if body is Bird:
		Global.game_over()

func _on_area_add_point_body_entered(body: Node2D) -> void:
	if body is Bird:
		Global.increase_Score()
