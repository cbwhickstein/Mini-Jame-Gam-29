extends CharacterBody2D

# Signals
signal player_hurt(collider)
signal player_collect(collider)

# Subnodes
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# global vars
var speed = 10.0
var current_pos = 1 # possible 0, 1, 2

var x_position_multiplier = 100
var original_speed_multiplier = 10
var speed_multiplier = 10
var lane_change_speed_multiplier = 2.0
var hurt = false
var hurt_animation_timer = 0.0
var hurt_animation_timer_max = 0.5
var life_points = 3

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
	collision = move_and_collide(movement * speed_multiplier * delta)
	if (collision != null):
		if (collision.get_collider().name.contains("enemy")):
			player_hurt.emit(collision.get_collider())
			hurt = true
			life_points -= 1
		elif (collision.get_collider().name.contains("collectable")):
			player_collect.emit(collision.get_collider())
		
	# set sprite
	if (hurt):
		if (hurt_animation_timer == 0.0):
			animated_sprite_2d.play("hurt")
			if (life_points == 0):
				speed_multiplier = 0
		hurt_animation_timer += delta
		if (hurt_animation_timer > hurt_animation_timer_max):
			hurt_animation_timer = 0.0
			hurt = false
			
			if (life_points == 0):
				get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")
				
			
			
	else:
		animated_sprite_2d.play("run_up")
