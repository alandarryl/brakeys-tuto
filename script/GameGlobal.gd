extends Node

var max_lives: int = 3
var current_lives: int = 3

func lose_life():
	current_lives -= 1
	print("Vies restantes : ", current_lives)
	
	if current_lives <= 0:
		game_over()
	else:
		# Si le joueur a encore des vies, ON RECHARGE ICI
		get_tree().reload_current_scene()

func game_over():
	print("Game Over ! Retour au menu principal.")
	reset_game()
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func reset_game():
	current_lives = max_lives
