extends Area2D

@onready var timer = $Timer
@onready var dying = $Dying

func _on_body_entered(body):
	if body.name == "player" or body.is_in_group("Player"):
		Engine.time_scale = 0.5
		if body.has_node("CollisionShape2D"):
			body.get_node("CollisionShape2D").queue_free()
		dying.play()
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	print("you are dead with style")
	# On appelle juste GameGlobal, c'est lui qui gère la suite !
	GameGlobal.lose_life()
