extends CharacterBody2D
class_name Bird

const SPEED = 200.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	if Global.is_start:
		if not is_on_floor():
			velocity += get_gravity() * delta
		# Saltar con ui_accept (teclado o gamepad)
		if Input.is_action_just_pressed("ui_accept"):
			jump()
	move_and_slide()
	rotation_bird()

func _input(event: InputEvent) -> void:
	# Detectar toques de pantalla
	if event is InputEventScreenTouch and event.pressed:
		if Global.is_start:
			jump()

	# Detectar clics del ratón (emulados como toques)
	elif event is InputEventMouseButton and event.pressed:
		if Global.is_start:
			jump()

func jump():
	# Lógica del salto
	velocity.y = JUMP_VELOCITY
	rotation = deg_to_rad(-30)
	$AudioFly1.play()

func rotation_bird():
	# Rotación del pájaro basada en la dirección de la velocidad
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += 2 * deg_to_rad(1)
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation -= 2 * deg_to_rad(1)
