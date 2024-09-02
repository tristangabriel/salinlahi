extends Sprite2D

var pressing = false
@export var maxDisplace = 120 
@export var deadZone = 5
@onready var parent = $".."

func _process(delta):
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= maxDisplace:
			global_position = get_global_mouse_position()
		else: 
			var angle = parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x + cos(angle) * maxDisplace
			global_position.y = parent.global_position.y + sin(angle) * maxDisplace
		calcVector()
	else: 
		global_position = lerp(global_position, parent.global_position, delta * 30)
		parent.posVec = Vector2(0,0)
	print(parent.posVec)
	
func calcVector():
	if abs((global_position.x - parent.global_position.x)) >= deadZone:
		parent.posVec.x = (global_position.x - parent.global_position.x)/maxDisplace
	if abs((global_position.y - parent.global_position.y)) >= deadZone:
		parent.posVec.y = (global_position.y - parent.global_position.y)/maxDisplace

func _on_button_button_down():
	pressing = true
func _on_button_button_up():
	pressing = false
