extends Node2D
var life = 20
var score = 0
onready var label = get_node("GameOver/Label")
onready var but = get_node("GameOver/Button")
onready var gerador = get_node("GeraBaloes/Gerador")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if life == 0:
		gerador.stop = true
		label.show()
		but.show()


func _on_Button_pressed():
	get_tree().change_scene("res://Menu.tscn")

func deading(balao):
	if balao.destruivel:
		life -=1
func pontuar(balao):
	if balao.destruivel:
		life +=1