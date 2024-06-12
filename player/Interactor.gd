extends RayCast3D
@onready var prompt = $Label #text prompt

#I had to add these below because if you spam the interact key, the other controls for the dialog
#system bug, don't know if that's something I can fix, but for now, just going to add a cooldown.

var can_interact = true
var can_prompt = true
@onready var cooldown = $Timer

func _process(delta):
	prompt.text = ""
	
	#reference raycast collider
	if is_colliding():
		var collider = get_collider()
		
		#call to the interactable script to get a prompt
		if collider is interactable and can_prompt == true:
			prompt.text = collider.prompt_message

		#interact
		if Input.is_action_just_pressed("interact") and can_interact == true:
			if can_prompt == true:
				collider.interact(owner)
				can_interact = false
				can_prompt = false
				prompt.text = ""
			cooldown.start()

func _on_timer_timeout():
	can_interact = true
	can_prompt = true
