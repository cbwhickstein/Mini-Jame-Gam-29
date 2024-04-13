extends Node2D

# global vars
var player: CharacterBody2D = null

func _ready():
	player = get_node("../Player")
	if (player == null):
		print("Player could not connect to camera node")
	else:
		position.x = player.x_position_multiplier


func _process(delta):
	if (player != null):
		position.y = player.position.y
