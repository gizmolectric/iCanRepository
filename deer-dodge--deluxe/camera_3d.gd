extends Camera3D

var last_vehicle_position: Vector3

func _ready() -> void:
	# Store the initial world position of the vehicle
	last_vehicle_position = get_parent().global_position

func _process(delta: float) -> void:
	var vehicle = get_parent()
	if not vehicle:
		return

	# Calculate how much the vehicle moved since last frame
	var vehicle_delta = vehicle.global_position - last_vehicle_position
	last_vehicle_position = vehicle.global_position

	# Remove sideways (X-axis) movement from the camera
	global_position -= Vector3(vehicle_delta.x, 0, 0)
