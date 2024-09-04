extends Node2D

var rng = RandomNumberGenerator.new()
var thisnode = preload("res://scene/trash.tscn")
var first = preload("res://scene/trash.tscn")
var second = preload("res://scene/trash.tscn")
var third = preload("res://scene/trash.tscn")
var fourth = preload("res://scene/trash.tscn")
var trash = [0, first, second, third, fourth]

var sure_number = [0, 13, 9, 1, 0]
var addend_number = [0, 9, 7, 1, 1]
var addend_chance = [0, 0.6, 0.65, 0.2, 0.6]
var ordering = []
var num_of_trash = [0]
var sum_trash = 0
# Called when the node enters the scene tree for the first time.

func inst(trash_kind, pos):
	var instance = trash_kind.instantiate()
	instance.position = pos
	add_child(instance)
	

func generateY(height):
	var botmargin = 10
	var topmargin = 20
	return (rng.randi_range(botmargin, height-topmargin) )


func generateX(width, i):
	var gap = (width- (2*50)) / sum_trash
	var nudge = (gap/2) - 60
	return (gap*i+ rng.randi_range(-nudge, nudge))


func makeOrder():
	for i in range(1, 5):
		for a in num_of_trash[i]:
			ordering.append(i)
	ordering.shuffle()
	

func num_trash():
	for i in range(1, 5):  #i is level of trash
		var x = sure_number[i]
		for j in addend_number[i]:
			if (rng.randf_range(0, 1) < addend_chance[i]):
				x += 1
		num_of_trash.append(x)
		sum_trash += x
		
		
func _ready() -> void:
	num_trash()
	makeOrder()
	print(ordering)
	for i in sum_trash:
		inst(trash[ordering[i]], Vector2(generateX(5700, i), 
			generateY(1150)))
