extends Position2D
onready var balao = preload("res://Baloes.tscn")
onready var white = get_node("../../BalloonWhite")	
var delay = 3
var stop = false
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if !stop:
		var novo_balao = balao.instance()
		novo_balao.destruivel = false
		novo_balao.position += Vector2(rand_range(-170,-120), 0)
		var r = rand_range(-256,256)
		var g = rand_range(-256,256)
		var b = rand_range(-256,256)
		novo_balao.modulate = Color(r,g,b)
		if delay == 3:
			white.modulate = Color(r,g,b)
			delay -= 1
		elif delay == 0:
			delay = 3
		else:
			delay -= 1
		if white.modulate == novo_balao.modulate:
			novo_balao.destruivel = true
		print(novo_balao.destruivel)
		get_owner().add_child(novo_balao)