extends StaticBody2D

@export var correct:String

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color("#fff", 0.8)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_dragging:
		modulate = Color("#fff", 1)
	else:
		modulate = Color("#fff", 0.8)
		
	
