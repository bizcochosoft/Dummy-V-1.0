extends Node2D
class_name controlador

# Use load() instead of preload() if the path isn't known at compile-time.
var ESCENA_FINAL = preload("res://escena_final/escena-final.tscn").instantiate()
var personaje_vivo = true

func _on_personaje_caer():
	personaje_vivo = false
	
func _process(_delta):
	if personaje_vivo == false:
		add_child(ESCENA_FINAL)
		get_tree().change_scene_to_packed(ESCENA_FINAL)

func final_de_partida ():
	add_child(ESCENA_FINAL)

func _on_area_2d_body_entered(_body):
	final_de_partida()
