extends Control

@onready var main_scene = $"../../../"


func _on_resume_pressed():
	main_scene.pauseMenu() 


func _on_quit_pressed():
	get_tree().quit()
