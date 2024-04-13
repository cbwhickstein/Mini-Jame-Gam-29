extends Node2D

# global vars
var player: CharacterBody2D = null
var enemy_list: Array = []

func _ready():
	player = get_node("../Player")
	if (player == null):
		print("Enemy_Spawner could not connect to Player")
	

func _process(delta):
	
