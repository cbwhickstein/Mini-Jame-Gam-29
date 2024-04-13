extends Node2D


# Subnodes
@onready var tile_map: TileMap = $TileMap

# global variables
var map_width = 100
var map_height = 100

var player_coords: Vector2 = Vector2(0.0, 0.0)
var player_old_coords: Vector2 = Vector2(0.0, 0.0)

var row_list: Array = []

var player: CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# sets the initial map
	for h in range(0, -map_height, -1):
		row_list.push_front([])
		for w in range(0, map_width):
			var current_pos = Vector2i(w, h)
			row_list[0].push_front(current_pos)
		tile_map.set_cells_terrain_connect(0,row_list[0],0,0)
		
	# connect to player node for movement capturing
	player = get_node("../Player")
	if player == null:
		print("Player could not connect to background node")	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if (player != null):
		# if player_cords are moveing a new tile row gets created and saved in row_list
		if (abs(player.position.y - player_old_coords.y) > 10.0):
			# reset condition
			player_old_coords = player.position
			
			# create new row
			row_list.push_front([])
			for w in range(0, map_width):
				var current_pos = Vector2i(w, row_list[1][0].y - 1)
				row_list[0].push_front(current_pos)
				
			# set row 
			tile_map.set_cells_terrain_connect(0,row_list[0],0,0)

