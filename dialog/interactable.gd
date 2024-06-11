extends CollisionObject3D
class_name interactable

signal Interacted(body)
@export var prompt_message = "Talk [E]"

func interact(body):
	Interacted.emit(body)

