extends StaticBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var sprites_list = ["emporio", "polnareff"]
	animated_sprite_2d.play(sprites_list[randi() % sprites_list.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
