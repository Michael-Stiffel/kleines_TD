extends Label
var enemies_left
var initial_enemies_left
var wave_state
# Called when the node enters the scene tree for the first time.
func _ready():
	enemies_left = 0
	initial_enemies_left = 0
	wave_state = "between"
	text = "ENEMIES:" + str(enemies_left)  


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text ="ENEMIES:" + str(enemies_left)
	if enemies_left >= initial_enemies_left/2:
		set("theme_override_colors/font_color",Color("ff0000"))
	elif enemies_left > initial_enemies_left/4 && enemies_left < initial_enemies_left/2:
		set("theme_override_colors/font_color",Color("e6ff00"))
	elif enemies_left < initial_enemies_left/4:
		set("theme_override_colors/font_color",Color("00ff00"))
		
		

func set_enemies_left(new_value):
	enemies_left = new_value

func set_initial_enemies_left(new_value):
	initial_enemies_left = new_value

func set_wave_state(new_value):
	wave_state = new_value
	
func get_wave_state():
	return wave_state
