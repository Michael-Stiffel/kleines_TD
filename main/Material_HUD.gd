extends Label

var mats
var initial_enemies_left
# Called when the node enters the scene tree for the first time.
func _ready():
	mats = 0
	initial_enemies_left = 0
	text = "Material:" + str(mats)  


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text ="Material:" + str(mats)  
	set("theme_override_colors/font_color",Color("fdbe00"))

		

