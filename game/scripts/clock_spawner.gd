extends Node2D

# global vars
@onready var clock_scene = preload("res://Scenes/clock.tscn")
var player = null
var clock_list = []
var clock_spawn_counter = 0.0
var clock_spawn_counter_max = 1.5
var x_position_multiplier = 100
var y_offset = 300

func _ready():
	player = get_node("../Player")
	if player == null:
		print("Clock_Spawner could not connect to Player")
	else:
		player.connect("player_clock_collect", _on_player_clock_collect)

func _process(delta):
	clock_spawn_counter += delta
	if (clock_spawn_counter > clock_spawn_counter_max):
		create_new_clock()
		clock_spawn_counter = 0
	
	for clock in clock_list:
		if (clock.position.y > player.position.y + 100):
			clock_list.erase(clock)
			remove_child(clock)
			clock.queue_free()
			
func create_new_clock():
	var new_clock = clock_scene.instantiate()
	add_child(new_clock)
	new_clock.name = "clock"
	clock_list.push_front(new_clock)
	
	if (player != null):
		new_clock.position = Vector2((randi() % 3) * x_position_multiplier, player.position.y - y_offset)

func _on_player_clock_collect(collider):
	clock_list.erase(collider)
	remove_child(collider)
	collider.queue_free()
