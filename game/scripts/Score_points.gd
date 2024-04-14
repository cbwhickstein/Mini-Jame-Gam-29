extends Label


func _ready():
	text = "%d\n\n%d\n\n%d" % [GlobalVars.score, GlobalVars.emporios, GlobalVars.turtles]
