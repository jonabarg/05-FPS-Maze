extends KinematicBody

onready var Camera = $Pivot/Camera
onready var Light = $Pivot/SpotLight

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002
var mouse_range = 1.2

onready var displayBat = get_node_or_null("/root/Game/Battery/Label")
onready var drainBat = get_node_or_null("/root/Game/Battery/Timer")
var power = true

var velocity = Vector3()

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	if Input.is_action_pressed("light") and power:
		Light.visible = true
	else:
		Light.visible = false
	
	input_dir = input_dir.normalized()
	return input_dir

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)

func _physics_process(delta):
	if Light.visible:
		drainBat.paused = false
		if displayBat == null:
			displayBat = get_node_or_null("/root/Game/Battery/Label")
		if drainBat == null:
			drainBat = get_node_or_null("/root/Game/Battery/Timer")
		if drainBat != null and displayBat != null:
			var charge = 100 / (drainBat.wait_time / (drainBat.time_left + .01))
			displayBat.text = "Battery: " + str(round(charge)) + "%"
	else:
		drainBat.set_paused(true)
	
	
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)


func _on_Timer_timeout():
	power = false
