extends Node3D

@export var rotation_speed: float = 90.0
@export var slide_speed: float = 3.0
@export var hook_speed: float = 2.0

@onready var slider = $Slider
@onready var hook = $Slider/Hook

var slider_max: float = 5.2
var slider_min: float = 0.5
var hook_min: float = -4.0
var hook_max: float = -0.25
	
func _process(delta):
	if (Input.is_action_pressed("turn_left")):
		rotate(Vector3.UP, deg_to_rad(rotation_speed) * delta)
	if (Input.is_action_pressed("turn_right")):
		rotate(Vector3.UP, deg_to_rad(-rotation_speed) * delta)
	if (Input.is_action_pressed("slide_forward")):
		slider.translate(Vector3.FORWARD * -slide_speed * delta)
	if (Input.is_action_pressed("slide_back")):
		slider.translate(Vector3.FORWARD * slide_speed * delta)
	if (Input.is_action_pressed("lower_hook")):
		print("lower")
		hook.translate(Vector3.DOWN * hook_speed * delta)
	if (Input.is_action_pressed("raise_hook")):
		print("raise")
		hook.translate(Vector3.DOWN * -hook_speed * delta)

	
	var slider_pos = slider.position
	slider_pos.z = clamp(slider_pos.z, slider_min, slider_max)
	slider.position = slider_pos
	
	var hook_pos = hook.position
	hook_pos.y = clamp(hook_pos.y, hook_min, hook_max)
	hook.position = hook_pos
