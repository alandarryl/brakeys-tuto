extends Area2D

@onready var coin = $"."

var gather_coins = 0

func _on_body_entered(body):
	print("+1 coin")
	gather_coins+=1
	print(gather_coins)
	queue_free()
	
