extends Node2D

# global vars
var player: CharacterBody2D = null
var enemy_list: Array = []
var enemy_spawn_counter = 0.0
var enemy_spawn_counter_max = 1.0
var x_position_multiplier = 100
var y_offset = 300

var enemy_scene = preload("res://Scenes/enemy.tscn")

func _ready():
	player = get_node("../Player")
	if (player == null):
		print("Enemy_Spawner could not connect to Player")
	else:
		player.connect("player_hurt", _on_player_hurt)

func _process(delta):
	enemy_spawn_counter += delta
	if (enemy_spawn_counter > enemy_spawn_counter_max):
		enemy_spawn_counter = 0.0
		create_new_enemy()
		
	for enemy in enemy_list:
		if (enemy.position.y > player.position.y + 100):
			enemy_list.erase(enemy)
			remove_child(enemy)
			enemy.queue_free()

func create_new_enemy():
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)
	new_enemy.name = "enemy"
	enemy_list.push_front(new_enemy)
	
	if (player != null):
		new_enemy.position = Vector2((randi() % 3) * x_position_multiplier, player.position.y - y_offset)
	
func _on_player_hurt(collider):
	print("Collision")
	enemy_list.erase(collider)
	remove_child(collider)
	collider.queue_free()
	
