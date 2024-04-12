extends Node2D

# Subnodes
@onready var tile_map: TileMap = $TileMap

# global variables
var map_width = 10
var map_height = 10

var player_coords: Vector2 = Vector2(0.0, 0.0)
var player_old_coords: Vector2 = Vector2(0.0, 0.0)

var row_list: Array = []

# INFO:
# erase_cell(layer: int, coords: Vector2i)
# set_cell(layer: int, coords: Vector2i)

# Called when the node enters the scene tree for the first time.
func _ready():
	for h in range(0, map_height):
		row_list.push_front([])
		for w in range(0, map_width):
			var current_pos = Vector2i(w, h)
			row_list[0].push_front(current_pos)
		tile_map.set_cells_terrain_connect(0,row_list[0],0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
