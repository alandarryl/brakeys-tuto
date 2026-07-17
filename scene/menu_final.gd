extends Control

const MAIN_MENU_SCENE = "res://scene/main_menu.tscn"

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
