extends Node2D

const SPEED = 60
var direction = 1

@onready var raycast_right = $raycast_right
@onready var raycast_left = $raycast_left
@onready var raycast_rightdown = $raycast_rightdown
@onready var raycast_leftdown = $raycast_leftdown
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	# Right-side checks
	if raycast_right.is_colliding() or not raycast_rightdown.is_colliding():
		direction = -1 # Turn left
		animated_sprite.flip_h = true
		
	# Left-side checks
	elif raycast_left.is_colliding() or not raycast_leftdown.is_colliding():
		direction = 1 # Turn right
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
