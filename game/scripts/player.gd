extends CharacterBody2D

# Subnodes
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# global vars
var speed = 100.0
var current_pos = 1 # possible 0, 1, 2

var x_position_multiplier = 100

func _ready():
	pass # Replace with function body.


func _process(delta):
	# capture input 
	var movement = Vector2(0, -speed)
	if (Input.is_action_just_pressed("ui_right") and current_pos < 2):
		current_pos += 1
	if (Input.is_action_just_pressed("ui_left") and current_pos > 0):
		current_pos -= 1
		
	position.x = current_pos * x_position_multiplier
	
	move_and_collide(movement.normalized())
	
	if (movement.length() > 0):
		animated_sprite_2d.play("run_up")
	else:
		animated_sprite_2d.play("idle_up")
