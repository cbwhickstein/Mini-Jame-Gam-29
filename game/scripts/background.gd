extends Node2D

# Subnodes
@onready var tile_map: TileMap = $TileMap
@onready var static_body_2d: StaticBody2D = $StaticBody2D

# global variables
var map_width = 100
var map_height = 100

var player_coords: Vector2 = Vector2(0.0, 0.0)
var player_old_coords: Vector2 = Vector2(0.0, 0.0)

var row_list: Array = []

# INFO:
# erase_cell(layer: int, coords: Vector2i)
# set_cell(layer: int, coords: Vector2i)

# Called when the node enters the scene tree for the first time.
func _ready():
	# sets the initial map
	for h in range(-map_height, 0):
		row_list.push_front([])
		for w in range(0, map_width):
			var current_pos = Vector2i(w, h)
			row_list[0].push_front(current_pos)
		tile_map.set_cells_terrain_connect(0,row_list[0],0,0)
	
	print(row_list.size())
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# tmp code for scroll animation
	static_body_2d.move_and_collide(Vector2(0,-1))
	player_coords = static_body_2d.position
	
	# if player_cords are moveing a new tile row gets created and saved in row_list
	if (abs(player_coords.y - player_old_coords.y) > 10.0):
		# reset condition
		player_old_coords = player_coords
		
		# create new row
		row_list.push_front([])
		print(row_list.size())
		for w in range(0, map_width):
			var current_pos = Vector2i(w, row_list[1][0].y - 1)
			row_list[0].push_front(current_pos)
		print(row_list[0][0].y)
		# set row 
		tile_map.set_cells_terrain_connect(0,row_list[0],0,0)

		# remove last row 
		#var last_row = row_list.pop_back()
		#for pos in last_row:
		#	tile_map.set_cell(0, pos)
