extends CharacterBody3D

@onready var head = $CollisionShape3D/head
@export var SPEED = 0
@export var WALKSPEED : float
@export var RUNSPEED : float
@export var sens : float
@onready var menu = $CollisionShape3D/head/menu
var paused = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event): #get mouse
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		_handle_camera_rotation(event)
		
func _handle_camera_rotation(event: InputEvent):
	#rotate the y cord horizontally and vertically
	rotate_y(deg_to_rad(-event.relative.x * sens))
	head.rotate_x(deg_to_rad(-event.relative.y * sens))
	#clamp
	head.rotation.x = clamp(head.rotation.x, deg_to_rad(-60), deg_to_rad(90)) 

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	#set speed
	SPEED = WALKSPEED
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#run button
	if Input.is_action_pressed("run"):
		SPEED = RUNSPEED
	else: SPEED = WALKSPEED	
	
	if Input.is_action_just_pressed("pause"):
		pause_game()
	#set directions
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func pause_game():
	if paused:
		menu.hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		menu.show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused
	paused = !paused	
	
			
