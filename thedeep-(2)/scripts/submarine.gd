extends CharacterBody2D


@onready var joystick = $"../Controls/HBoxContainer/Joystick"
@export var speed = 125; @export var friction = 200; @export var acceleration = 1500
@onready var anim_player = $AnimationPlayer
@onready var player = $"."
@onready var joyPos = joystick.posVec
@onready var animTree = $AnimationTree
@onready var bubbles = $CPUParticles2D
@onready var sub = $submarine_sprites



func _physics_process(delta):
	player_movement(delta)
	player_animation()
	print(joyPos.normalized())
func player_movement(delta):
	joyPos = joystick.posVec
	if joyPos == Vector2(0,0):
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2(0,0)
	else:
		velocity += (joyPos * acceleration * delta)
		velocity = velocity.limit_length(speed)
	move_and_slide()
	
func player_animation():
		
	if velocity != Vector2.ZERO:
		if velocity.x < 0:
			
			if bubbles.position.x < 0:
				bubbles.position.x *= -1
				sub.scale.x *= -1
		else:
			
			if bubbles.position.x > 0:
				bubbles.position.x *= -1
				sub.scale.x *= -1
