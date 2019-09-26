extends Node2D
var dragMouse = false

func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragMouse:
		if get_viewport().get_mouse_position().x >= 219 and get_viewport().get_mouse_position().x <= 239:
			$centro1.show()
			$centro2.hide()
			$centro3.hide()
		if get_viewport().get_mouse_position().x >= 179 and get_viewport().get_mouse_position().x <= 199:
			$centro2.show()
			$centro1.hide()
			$centro3.hide()
		if get_viewport().get_mouse_position().x >= 88 and get_viewport().get_mouse_position().x <= 108:
			$centro3.show()
			$centro1.hide()
			$centro2.hide()
		
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragMouse = true
		else:
			dragMouse = false
			$centro1.show()
			$centro2.hide()
			$centro3.hide()
			