extends Node3D

@onready var trigger = $RigidBody3D/Trigger
	
func _process(delta):
	pass


func _on_trigger_body_entered(body):
	print(body)
