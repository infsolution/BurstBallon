extends RigidBody2D
onready var time = get_node("../Timer")
onready var balao = get_node("../../Baloes")
var cena
func _ready():
	cena = get_tree().get_current_scene()
	set_process(true)
	
func _process(delta):
	if self.position.y <= 0:
		cena.deading(get_owner())
		queue_free()
	


func _on_Balao_body_entered(body):
	if body.name == "BodyPedra":
		$Balao_animi.play("estouro")
		delay()
		
func delay():
	time.set_wait_time(0.2)
	time.start()
	yield(time, "timeout")
	queue_free()