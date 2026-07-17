extends Control

# Prépare le chemin vers ta scène de jeu (Modifie le chemin si ton fichier s'appelle différemment !)
const GAME_SCENE_PATH = "res://scene/game.tscn" 

func _on_play_buton_pressed() -> void:
	get_tree().change_scene_to_file(GAME_SCENE_PATH)


func _on_quit_buton_pressed() -> void:
	get_tree().quit()
