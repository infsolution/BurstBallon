extends Position2D
onready var pedra = preload("res://Pedra.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cena
# Called when the node enters the scene tree for the first time.
func _ready():
	cena = get_tree().get_current_scene()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("pegar_pedra"):
			if cena.autori_pedra():
				var new_pedra = pedra.instance()
				cena.set_veri_pedra(false)
				new_pedra.position = self.position + Vector2(293,430)
				print(new_pedra.get_instance_id())
				get_owner().add_child(new_pedra)
			