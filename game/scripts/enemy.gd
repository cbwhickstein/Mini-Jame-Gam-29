extends StaticBody2D

# global vars
var speed_multiplier = 100.0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(Vector2(0, 1) * speed_multiplier * delta)
