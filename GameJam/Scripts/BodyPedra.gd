extends StaticBody2D

export var vel = 1300
onready var pedra = get_node("../../Pedra")
var dragMouse = false
var tiro = false
var ang = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !tiro:
		if pedra.position.x < 137.0:
			pedra.position.x = 139.0
			dragMouse = false
		elif pedra.position.x > 300.0:
			pedra.position.x = 299
			dragMouse = false
		if pedra.position.y < 347.0:
			pedra.position.y = 348.0
			dragMouse = false
		elif pedra.position.y > 547.0:
			pedra.position.y = 546
			dragMouse = false	
		if dragMouse:
			if pedra.position.x >= 137.0 and pedra.position.x <= 300.0 and pedra.position.y >= 347.0 and pedra.position.x <= 547.0:
				pedra.position = get_viewport().get_mouse_position()
				#print(pedra.position)
	if tiro:
		disparar(300-pedra.position.x, pedra.position.y, delta)
	#
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragMouse = true
		else:
			dragMouse = false
		if !event.is_pressed():
			tiro = true

func disparar(forca, angulo, delta):
	pedra.position += Vector2((forca + vel) * delta, -400 * delta)
	if pedra.position.x > 1024 or pedra.position.y > 900 or pedra.position.y <= 0:
		pedra.queue_free()