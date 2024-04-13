extends Node2D

# Subnodes
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D


func _ready():
	pass # Replace with function body.


func _process(delta):
	var movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	character_body_2d.move_and_collide(movement)
