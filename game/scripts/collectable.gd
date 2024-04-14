extends StaticBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var type = 0

func _ready():
	var sprites_list = ["emporio", "polnareff"]
	type = randi() % sprites_list.size()
	animated_sprite_2d.play(sprites_list[type])
	

func _process(delta):
	pass
