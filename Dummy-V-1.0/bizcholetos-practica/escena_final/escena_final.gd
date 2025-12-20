extends CanvasLayer

const NIVEL_1 = ("res://nivel-1/nivel-1.tscn")

func set_title (titulo):
	$VBoxContainer/titulo.text = titulo

func _on_button_button_down():
	get_tree().change_scene_to_file(NIVEL_1)
