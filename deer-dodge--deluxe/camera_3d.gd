extends Camera3D

@export var strafe_speed: float = 7.0  # Sideways speed (units per second)

func _process(delta: float) -> void:
	var input_dir := 0.0

	# Check input (A/D keys)
	if Input.is_action_pressed("CarX_Left"):
		input_dir += 1.8
	if Input.is_action_pressed("CarX_Right"):
		input_dir -= 1.8

	# Move sideways (local right vector)
	var movement := Vector3.RIGHT * input_dir * strafe_speed * delta
	translate(movement)
