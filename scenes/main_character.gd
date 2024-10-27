extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0
@onready var sprite_2d = $Sprite2D # drag sprite 2d then ctrl

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Animations
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity. 
	# 	delta is to make speed speed consistent on different fps  delta represents the time in seconds that has passed since the last frame
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		# gradually decelerates
		velocity.x = move_toward(velocity.x, 0, 20) # last value in this param was SPEED... which is instant stop
		
	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
