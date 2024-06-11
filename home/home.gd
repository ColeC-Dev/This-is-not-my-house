extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("timelinetest")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
