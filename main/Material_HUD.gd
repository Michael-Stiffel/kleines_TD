extends Label

var mats
var initial_mats
var wave_state
var once_per_wave 
var number_of_Miners
var quality_of_Ore
var buttons

# Called when the node enters the scene tree for the first time.
func _ready():
	mats = 0
	number_of_Miners = 1
	quality_of_Ore = 1
	initial_mats = 0
	text = "Material:" + str(mats)  
	once_per_wave = 0 
	buttons = get_tree().get_nodes_in_group("Updates")
	buttons[0].connect("pressed",buy_more_miners.bind() )
	buttons[1].connect("pressed", buy_better_ore.bind())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	wave_state = get_node("../../Camera2D/Enemies_left").get_wave_state()
	if wave_state == "Ende" && once_per_wave == 0:
		mats = int(mats  + (10 * number_of_Miners*quality_of_Ore))
		once_per_wave = 1
	if wave_state == "Start" :
		once_per_wave = 0
	text ="Material:" + str(mats)  
	set("theme_override_colors/font_color",Color("fdbe00"))

		

func to_expensive(value):
	return (value > mats)
	
	
	

func buy_shit(value):
	mats = mats - value

func buy_more_miners():
	var cost_number_of_Miners = number_of_Miners*5
	if to_expensive(cost_number_of_Miners):
		return false
	else:
		buy_shit(cost_number_of_Miners)
		number_of_Miners = number_of_Miners + 1
	
func buy_better_ore():
	var cost_quality_of_Ore = int(pow(quality_of_Ore,3))
	if to_expensive(cost_quality_of_Ore):
		return false
	else:
		buy_shit(cost_quality_of_Ore)
		quality_of_Ore = quality_of_Ore + 0.1
	
