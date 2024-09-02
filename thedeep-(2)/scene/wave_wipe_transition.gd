extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer


@onready var wave_sprites: Sprite2D = $"wave sprites"


func _ready() -> void:
	wave_sprites.visible = false

func load_scene(tar_scene: String):
	animation_player.play("transition")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(tar_scene)
	animation_player.play_backwards("transition")
	
func reload (tar_scene: String):
	animation_player.play("transition")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play_backwards("transition")
