extends Node2D



# global vars
@onready var collectable_scene = preload("res://Scenes/collectable.tscn")
var player = null
var collectable_list = []
var collectable_spawn_counter = 0.0
var collectable_spawn_counter_max = 1.0
var x_position_multiplier = 100
var y_offset = 300

func _ready():
	player = get_node("../Player")
	if player == null:
		print("Collectable_Spawner could not connect to Player")
	else:
		player.connect("player_collect", _on_player_collect)

func _process(delta):
	collectable_spawn_counter += delta
	if (collectable_spawn_counter > collectable_spawn_counter_max):
		create_new_collectable()
		collectable_spawn_counter = 0
	
	for collectable in collectable_list:
		if (collectable.position.y > player.position.y + 100):
			collectable_list.erase(collectable)
			remove_child(collectable)
			collectable.queue_free()
			
func create_new_collectable():
	var new_collectable = collectable_scene.instantiate()
	add_child(new_collectable)
	new_collectable.name = "collectable"
	collectable_list.push_front(new_collectable)
	
	if (player != null):
		new_collectable.position = Vector2((randi() % 3) * x_position_multiplier, player.position.y - y_offset)

func _on_player_collect(collider):
	collectable_list.erase(collider)
	remove_child(collider)
	collider.queue_free()
