extends RayCast3D
@onready var prompt = $Label
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	prompt.text = ""
	
	if is_colliding():
		var collider = get_collider()
		
		if collider is interactable:
			prompt.text = collider.prompt_message
			
			if Input.is_action_just_pressed("interact"):
				collider.interact(owner)
			
