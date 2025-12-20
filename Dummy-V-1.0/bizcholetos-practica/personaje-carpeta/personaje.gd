extends CharacterBody2D
class_name personaje

@export var gravity = 1200
@export var jump_velocity = 900
@export var speed = 200
@export var demasiado_abajo = 950

signal caer

func _physics_process(delta):
	
	#horizontal
	var direction = Input.get_axis("izquierda", "derecha")
	velocity.x = speed * direction
	
	
	#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
		
	#saltar
	var jump_pressed = Input.is_action_just_pressed("saltar")
	if jump_pressed and is_on_floor():
		velocity.y = velocity.y - jump_velocity
	
	if position.y > demasiado_abajo:
		queue_free()
		caer.emit()
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	print("El ", body.name, " ha entrado en el área")
