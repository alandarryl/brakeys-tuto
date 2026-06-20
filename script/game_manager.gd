extends Node

var score = 0
@onready var label = $Label

func add_coin():
	score +=1
	label.text = "Your score is " + str(score) + " !"
