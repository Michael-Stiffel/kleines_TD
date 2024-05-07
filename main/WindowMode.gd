extends HBoxContainer

@onready var option_button = $OptionButton as OptionButton


var user_prefs: UserPreferences
const WONDOW_MODE_ARRAY: Array[String] = [
	"Fullscreen",
	"Window Mode",
	"Borderlees Window",
	"Borderless Fullscreen"	
	] 
	
	
func _ready():
	user_prefs = UserPreferences.load_or_create()
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)
	
	
func add_window_mode_items() -> void:
	for window_mode in WONDOW_MODE_ARRAY:
		option_button.add_item(window_mode)
		
func on_window_mode_selected(index : int ) -> void:
	match index:
		0: # Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	
		1: # Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			user_prefs.window_mode_value = DisplayServer.WINDOW_MODE_WINDOWED
			user_prefs.window_mode_flag = false
			user_prefs.save()
		2: # Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	
		3: # Borderless Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		
