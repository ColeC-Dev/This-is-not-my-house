extends CollisionObject3D
class_name interactable

signal Interacted(body)
@export var prompt_message = "..."

func interact(body):
	Interacted.emit(body)


