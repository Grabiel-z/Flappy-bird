extends CanvasLayer
func _ready() -> void:
	Global.connect("on_increase_score", change_score)
func change_score():
	$LabelScore.text=str(Global.score)
