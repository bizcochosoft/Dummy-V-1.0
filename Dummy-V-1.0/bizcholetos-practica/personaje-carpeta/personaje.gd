extends CharacterBody2D
class_name personaje

@export var gravity = 250
@export var jump_velocity = 230
@export var speed = 74
@export var demasiado_abajo = 185


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
	
	
	for i in get_slide_collision_count():
		var colision = get_slide_collision(i)
		var objetoChocado = colision.get_collider()
		
		
		if objetoChocado == $"../TileMapLayer":
			var punto_golpe = colision.get_position()
			var normal = colision.get_normal()
			
			
			
			if normal.y < 0:
				
				
				var pos_para_revisar = punto_golpe - (normal * 4)
				
				var pos_local = objetoChocado.to_local(pos_para_revisar)
				var coord_mapa = objetoChocado.local_to_map(pos_local)
				
				var datos = objetoChocado.get_cell_tile_data(coord_mapa)
				
				if datos and datos.get_custom_data("esRompible"):
					objetoChocado.erase_cell(coord_mapa)

 
					
					#


	
	
	
	var tamano_pantalla = get_viewport_rect().size
	print( get_viewport_rect().size)
	
	if global_position.x > tamano_pantalla.x:
		global_position.x=0
	if global_position.x < 0 :
		global_position.x= tamano_pantalla.x
		


func _on_area_2d_body_entered(body):
	print("El ", body.name, " ha entrado en el área")
