extends Node2D

func _on_back_to_main_pressed():
	get_tree().change_scene_to_file("res://Scenes/loading_screen.tscn")
