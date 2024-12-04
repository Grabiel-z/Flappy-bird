extends CharacterBody2D
class_name Bird
const SPEED = 600.0
const JUMP_VELOCITY = -200.0
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	move_and_slide()
