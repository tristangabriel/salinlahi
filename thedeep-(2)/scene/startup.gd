extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play('fade-in')

func change_to_main_menu():
	get_tree().change_scene_to_file("res://scene/menu.tscn")
