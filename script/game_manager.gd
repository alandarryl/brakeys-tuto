extends Node

var score = 0
@onready var label = $Label
@onready var score_label: Label = %ScoreLabel
const MENU_FINAL = "res://scene/menu_final.tscn"

func _ready() -> void:
	score_label.text = "Welcome you have: " + str(score)

func game_complete() -> void:
	get_tree().change_scene_to_file(MENU_FINAL)

func add_coin():
	score +=5
	label.text = "Your score is " + str(score) + " !"
	score_label.text = "You have : " + str(score)
	
	if score >= 20:
		print("you got all you need")
		game_complete()
