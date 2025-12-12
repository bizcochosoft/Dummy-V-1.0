extends CharacterBody2D
class_name personaje

@export var speed = 300
@export var gravity = 300
@export var jump_velocity = 500

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
	
	move_and_slide()
