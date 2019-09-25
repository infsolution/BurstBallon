extends Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var cena
# Called when the node enters the scene tree for the first time.
func _ready():
	cena = get_tree().get_current_scene()
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func sobe():
	$Sprite.position += Vector2(0, -5)
func desce():
	$Sprite.position += Vector2(0, +5)
	if $Sprite.position.y >= 199:
		cena.ganhou = true
	#print($Sprite.position)