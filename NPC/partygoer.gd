extends interactable

enum random_strings {
	FUNNY,
	SAD,
	NEUTRAL,
	HAPPY,
	PISSED,
	RANDOM
}
var currentState = random_strings

func _ready():
	currentState = randi()%6
	
func _on_interacted(body):
	match currentState:
		random_strings.FUNNY:
			Dialogic.start("FUNNY")
		random_strings.SAD:
			Dialogic.start("SAD")
		random_strings.NEUTRAL:
			Dialogic.start("NEUTRAL")
		random_strings.HAPPY:
			Dialogic.start("HAPPY")
		random_strings.PISSED:
			Dialogic.start("PISSED")
		random_strings.RANDOM:
			Dialogic.start("RANDOM")
		
