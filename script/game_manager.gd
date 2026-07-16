extends Node

var score = 0
@onready var label = $Label
@onready var score_label: Label = %ScoreLabel

func _ready() -> void:
	score_label.text = "Welcome you have: " + str(score)

func add_coin():
	score +=1
	label.text = "Your score is " + str(score) + " !"
	score_label.text = "You have : " + str(score)
