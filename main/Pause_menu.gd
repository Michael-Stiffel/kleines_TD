extends Control

@onready var main_scene = $"../../Main"

@onready var master_slider = %"Master Volume Slider"
@onready var music_slider = %"Music Volume Slider"
@onready var sfx_slider = %"SFX Volume Slider"
@onready var window_mode = $MarginContainer/VBoxContainer2/WindowMode/OptionButton
@onready var resulution = $MarginContainer/VBoxContainer2/ResolutionMode/OptionButton
var user_prefs: UserPreferences


func _ready():
	$MarginContainer/VBoxContainer2.visible = false
	user_prefs = UserPreferences.load_or_create()
	if sfx_slider:
		sfx_slider.value = user_prefs.sfx_audio_level
	if music_slider:
		music_slider.value = user_prefs.music_audio_level
	if master_slider:
		master_slider.value = user_prefs.master_audio_level
	if window_mode:
		window_mode.selected = user_prefs.window_mode
	if resulution:
		resulution.selected = user_prefs.resulution
func _on_resume_pressed():
	main_scene.pauseMenu() 


func _on_quit_pressed():
	get_tree().quit()


func _on_option_pressed():
	$MarginContainer/VBoxContainer.visible = false
	$MarginContainer/VBoxContainer2.visible = true
	
	 


func _on_back_pressed():
	if user_prefs:
		user_prefs.sfx_audio_level = sfx_slider.value
		user_prefs.music_audio_level = music_slider.value
		user_prefs.master_audio_level = master_slider.value
		user_prefs.window_mode = window_mode.selected
		user_prefs.resulution = resulution.selected
		user_prefs.save()
	$MarginContainer/VBoxContainer2.visible = false
	$MarginContainer/VBoxContainer.visible = true
	
	

func _on_quit_to_main_menue_pressed():
	
	get_tree().change_scene_to_file("res://main_menu.tscn")
