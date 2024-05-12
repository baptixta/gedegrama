extends Control

@export var letter: String
var draggable = false
var is_inside_dropable = false
var body_ref


# Called when the node enters the scene tree for the first time.
func _ready():
	#label recebe a letra escrita no editor
	$State.text = letter


func _on_drop_point_detector_mouse_entered():
	#if not global.is_dragging:
	pass


func _on_drop_point_detector_mouse_exited():
	pass # Replace with function body.


func _on_drop_point_detector_body_entered(body):
	pass # Replace with function body.


func _on_drop_point_detector_body_exited(body):
	pass # Replace with function body.
