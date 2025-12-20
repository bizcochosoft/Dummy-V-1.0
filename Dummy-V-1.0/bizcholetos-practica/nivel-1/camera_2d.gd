extends Camera2D
class_name camara

@export var objeto_a_seguir: Node2D

func _process(_delta):
	
	if objeto_a_seguir != null:
		position = objeto_a_seguir.position
	
func _physics_process(_delta):
	
	pass
