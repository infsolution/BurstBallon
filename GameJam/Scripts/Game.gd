extends Node2D
var life = 20
var sobe = true
var ganhou = false
onready var label = get_node("GameOver/Label")
onready var but = get_node("GameOver/Button")
onready var gerador = get_node("GeraBaloes/Gerador")
onready var fumaca = get_node("Fumaca")
onready var lab_parabens = get_node("Ganhou/LabelParabens")
onready var but_reset = get_node("Ganhou/ButtonRestart")
onready var pedra = get_node("Capanga/Pedra")
onready var play_game = get_node("res://asset/image/play_green.png")
var veri_pedra = true
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
	if ganhou:
		gerador.stop = true
		lab_parabens.show()
		but_reset.show()
	

func _on_Button_pressed():
	get_tree().change_scene("res://Menu.tscn")

func deading(balao):
	if balao.destruivel:
		life -=1
		fumaca.sobe()
func pontuar(balao):
	if balao.destruivel:
		life +=1
		fumaca.desce()
	else:
		life -=1
		fumaca.sobe()
func pontos():
	return life

func autori_pedra():
	return veri_pedra
func set_veri_pedra(autori):
	veri_pedra = autori

func _on_ButtonRestart_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_ButtonPause_pressed():
	if get_tree().paused:
		get_tree().paused =false
		$ButtonPause.text = "pause"
		#$ButtonPause.icon = play_game
		
	else:
		get_tree().paused=true
		$ButtonPause.text = "play"
