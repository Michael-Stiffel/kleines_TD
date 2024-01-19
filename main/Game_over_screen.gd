extends CanvasLayer

@onready var title = $PanelContainer/MarginContainer/Rows/Titel

func set_title(win : bool):
	if win:
		title.text = "U WIN"
		title.modulate = Color.GREEN
	else: 
		title.text = "U SUCK"
		title.modulate = Color.WHITE

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")
	
	
	
func _on_quit_button_pressed() -> void:
	get_tree().quit() 



