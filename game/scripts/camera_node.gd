extends Node2D

# global vars
var player: CharacterBody2D = null
var y_offset = 125
var life_points = 0
var life_points_sprites = []
var initial_heart_position = Vector2(100, -100)
var heart_position_offset = Vector2(100, 0)

func _ready():
	player = get_node("../Player")
	if (player == null):
		print("Player could not connect to camera node")
	else:
		position.x = player.x_position_multiplier
		life_points = player.life_points
		
		for point in range(0, life_points):
			life_points_sprites.push_front(Sprite2D.new())
			life_points_sprites[0].texture = preload("res://assets/Collectables/heart.png")
			life_points_sprites[0].set_texture_filter(TEXTURE_FILTER_NEAREST)
			life_points_sprites[0].scale * 10
			
			if (life_points_sprites.size() == 1):
				life_points_sprites[0].position = initial_heart_position
			else:
				life_points_sprites[0].position = life_points_sprites[1].position + heart_position_offset
			
			add_child(life_points_sprites[0])



func _process(delta):
	if (player != null):
		position.y = player.position.y - y_offset
