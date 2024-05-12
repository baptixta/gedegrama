extends Control

@export var letter: String
var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

var no_shadow = preload("res://sprites/cube.png")
var shadow_effect = preload("res://sprites/cube_shadow.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)

func _on_drop_point_detector_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		$Sprite.texture = shadow_effect
		scale = Vector2(1.05, 1.05)


func _on_drop_point_detector_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		$Sprite.texture = no_shadow
		scale = Vector2(1, 1)


func _on_drop_point_detector_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color("#fff", 1)
		body_ref = body


func _on_drop_point_detector_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color("#fff", 0.7)
