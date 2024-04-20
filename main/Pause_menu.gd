extends Control

@onready var main_scene = $"../../../"

@onready var master_slider = %"Master Volume Slider"
@onready var music_slider = %"Music Volume Slider"
@onready var sfx_slider = %"SFX Volume Slider"
var user_prefs: UserPreferences

func _ready():
	user_prefs = UserPreferences.load_or_create()
	if sfx_slider:
		sfx_slider.value = user_prefs.sfx_audio_level
	if music_slider:
		music_slider.value = user_prefs.music_audio_level
	if master_slider:
		master_slider.value = user_prefs.master_audio_level

func _on_resume_pressed():
	main_scene.pauseMenu() 


func _on_quit_pressed():
	get_tree().quit()


func _on_option_pressed():
	$MarginContainer/VBoxContainer/Resume.visible = false
	$MarginContainer/VBoxContainer/QuitToMainMenue.visible = false
	$MarginContainer/VBoxContainer/QuitToDesktop.visible = false
	$MarginContainer/VBoxContainer/Option.visible = false
	$"MarginContainer/VBoxContainer2/Master Volume".visible = true
	$"MarginContainer/VBoxContainer2/Master Volume Slider".visible = true
	$"MarginContainer/VBoxContainer2/Music Volume".visible = true
	$"MarginContainer/VBoxContainer2/Music Volume Slider".visible = true
	$"MarginContainer/VBoxContainer2/SFX Volume".visible = true
	$"MarginContainer/VBoxContainer2/SFX Volume Slider".visible = true
	$"MarginContainer/VBoxContainer2/Back".visible = true
	 


func _on_back_pressed():
	if user_prefs:
		user_prefs.sfx_audio_level = sfx_slider.value
		user_prefs.music_audio_level = music_slider.value
		user_prefs.master_audio_level = master_slider.value
		user_prefs.save()
	$MarginContainer/VBoxContainer/Resume.visible = true
	$MarginContainer/VBoxContainer/QuitToMainMenue.visible = true
	$MarginContainer/VBoxContainer/QuitToDesktop.visible = true
	$MarginContainer/VBoxContainer/Option.visible = true
	$"MarginContainer/VBoxContainer2/Master Volume".visible = false
	$"MarginContainer/VBoxContainer2/Master Volume Slider".visible = false
	$"MarginContainer/VBoxContainer2/Music Volume".visible = false
	$"MarginContainer/VBoxContainer2/Music Volume Slider".visible = false
	$"MarginContainer/VBoxContainer2/SFX Volume".visible = false
	$"MarginContainer/VBoxContainer2/SFX Volume Slider".visible = false
	$"MarginContainer/VBoxContainer2/Back".visible = false
	

func _on_quit_to_main_menue_pressed():
	
	get_tree().change_scene_to_file("res://main_menu.tscn")
