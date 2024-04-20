extends Control


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
		
func _on_back_pressed():
	if user_prefs:
		user_prefs.sfx_audio_level = sfx_slider.value
		user_prefs.music_audio_level = music_slider.value
		user_prefs.master_audio_level = master_slider.value
		user_prefs.save()
	get_tree().change_scene_to_file("res://main_menu.tscn")
	#$MarginContainer/VBoxContainer/Back_to_Menue.disabled
 


func _on_back_to_game_pressed():

	get_tree().change_scene_to_file("res://main.tscn")
	#$MarginContainer/VBoxContainer/Back_to_Game.disabled
