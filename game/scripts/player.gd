extends CharacterBody2D

# Signals
signal player_hurt

# Subnodes
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# global vars
var speed = 10.0
var current_pos = 1 # possible 0, 1, 2

var x_position_multiplier = 100
var speed_multiplier = 0.25
var original_speed_multiplier = 0.25
var lane_change_speed_multiplier = 2.0

var collision = null

func _ready():
	position.x = current_pos * x_position_multiplier
	pass # Replace with function body.


func _process(delta):
	# capture input 
	var movement = Vector2(0, -speed)
	if (Input.is_action_just_pressed("ui_right") and current_pos < 2):
		current_pos += 1
	if (Input.is_action_just_pressed("ui_left") and current_pos > 0):
		current_pos -= 1
		
	movement.x = move_toward(position.x, current_pos * x_position_multiplier, 20) - position.x
	
	# process collision
	collision = move_and_collide(movement * speed_multiplier)
	if (collision != null):
		if (collision.get_collider().name == "enemy"):
			player_hurt.emit()
		
	# set sprite
	if (movement.length() > 0):
		animated_sprite_2d.play("run_up")
	else:
		animated_sprite_2d.play("idle_up")
