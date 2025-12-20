extends CanvasLayer

const INICIO_DE_JUEGO = ("res://nivel-1/nivel-1.tscn")

func _on_button_button_down():
	get_tree().change_scene_to_file(INICIO_DE_JUEGO)
