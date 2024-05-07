class_name UserPreferences extends Resource

@export_range(0, 1, .05) var music_audio_level: float = 0.5
@export_range(0, 1, .05) var sfx_audio_level: float = 0.5
@export_range(0, 1, .05) var master_audio_level: float = 0.5
@export var window_mode : int = -1
@export var resulution : int = -1
@export var window_mode_value = DisplayServer.WINDOW_MODE_FULLSCREEN
@export var window_mode_flag = false
@export var resulution_value = Vector2i(2560, 1080)
func save() -> void:
	ResourceSaver.save(self, "user://user_prefs.tres")


static func load_or_create() -> UserPreferences:
	var res: UserPreferences = load("user://user_prefs.tres") as UserPreferences
	if !res:
		res = UserPreferences.new()
	return res
