extends Control




func _on_new_game_pressed() -> void:
	WaveWipeTransition.load_scene("res://scene/map.tscn")
	print("pressed")
