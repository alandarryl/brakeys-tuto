extends CharacterBody2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var camera = $Camera2D

@export var SPEED = 150.0
@export var JUMP_VELOCITY = -350.0
@onready var jump_sound = $jump

#control double jump
var init_jump_num = 2
var current_jump_num = 2


# 1. FIX: Define target offsets for the X axis, and a lerp speed
var target_offset_x = 0.0
@export var CAMERA_SMOOTH_SPEED = 1.0 # Higher number = faster camera pan

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else :
		current_jump_num = init_jump_num

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (current_jump_num > 0 or is_on_floor()):
		jump_sound.play()
		velocity.y = JUMP_VELOCITY
		current_jump_num -= 1

	var direction = Input.get_axis("left", "right")
	
	# 2. FIX: Update the *target* offset value instead of forcing the camera instantly
	if direction > 0:
		animatedSprite.flip_h = false
		target_offset_x = 50.0 # Look 100 pixels ahead to the right
	elif direction < 0:
		animatedSprite.flip_h = true
		target_offset_x = -50.0 # Look 100 pixels ahead to the left
	
	# 3. FIX: Smoothly slide the camera's X offset toward the target offset
	camera.offset.x = lerp(camera.offset.x, target_offset_x, CAMERA_SMOOTH_SPEED * delta)
	
	# Animations
	if is_on_floor():
		if direction == 0:
			animatedSprite.play("Idle")
		else:
			animatedSprite.play("Run")
	else:
		animatedSprite.play("jump")
	
	# Movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
