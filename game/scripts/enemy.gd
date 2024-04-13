extends StaticBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

# global vars
var speed_multiplier = 100.0

func _ready():
	var sprites_list = ["arrow", "knife", "rods"]
	animated_sprite_2d.play(sprites_list[randi() % 3])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(Vector2(0, 1) * speed_multiplier * delta)
