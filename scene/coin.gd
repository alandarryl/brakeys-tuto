extends Area2D

@onready var coin = $"."
@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

var gather_coins = 0

func _on_body_entered(body):
	game_manager.add_coin()
	animation_player.play("pickUp")
	
	
