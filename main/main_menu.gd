extends Control

var user_prefs: UserPreferences

func _ready():
	user_prefs = UserPreferences.load_or_create()
	match user_prefs.window_mode:
		0: # Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			
		1: # Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		
		2: # Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
			
		3: # Borderless Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
			
	DisplayServer.window_set_size(user_prefs.resulution_value)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://avatar_wahl_szene.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://option_menu.tscn")


func _on_multiplayer_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit() 
