extends Area2D

@onready var coin = $"."




func _on_body_entered(body):
	print("+1 coin")
	queue_free()
	
