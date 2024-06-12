extends interactable

func _on_interacted(body):
	#if body.is_in_group("testitem"):
	Dialogic.start("itemtest")
