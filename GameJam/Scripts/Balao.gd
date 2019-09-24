extends RigidBody2D
onready var time = get_node("../Timer")
func _ready():
	set_process(true)
	
func _process(delta):
	if self.position.y <= 0:
		#print("destruido")
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