extends Label

var tech_level
var buttons
# Called when the node enters the scene tree for the first time.
func _ready():
	tech_level = 0
	text = "Tech:" + str(tech_level)  
	buttons = get_tree().get_nodes_in_group("Updates")
	buttons[2].connect("pressed",update_tech_level.bind() )
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Tech:" + str(tech_level)  

func update_tech_level():
	var cost_tech_level = int(pow(tech_level,10)+10)
	if get_node("../Material").to_expensive(cost_tech_level):
		return false
	else:
		get_node("../Material").buy_shit(cost_tech_level)
		tech_level = tech_level +1
	
	
		
func get_tech_level():
	return tech_level
	
