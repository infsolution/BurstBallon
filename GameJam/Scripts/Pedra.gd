extends Node2D

export var vel = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#self.position += Vector2(vel * delta, -100 * delta)
	pass