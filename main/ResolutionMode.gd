extends HBoxContainer


@onready var option_button = $OptionButton as OptionButton

var user_prefs: UserPreferences

const RESOLUTION_DICTIONARY : Dictionary = {
	"2560 x 1080" : Vector2i(2560, 1080),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080" : Vector2i(1920, 1080),
}



func _ready():
	user_prefs = UserPreferences.load_or_create()
	
	option_button.item_selected.connect(on_resolution_selected)
	add_resolution_modes()

func add_resolution_modes() -> void :
	for resolution_size_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_size_text)
	

func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	user_prefs.resulution_value = RESOLUTION_DICTIONARY.values()[index]
	user_prefs.save()
