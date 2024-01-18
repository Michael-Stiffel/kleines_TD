extends Label
var HP;

# Called when the node enters the scene tree for the first time.
func _ready():
	HP = 100;
	text ="HP:" + str(HP)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text ="HP:" + str(HP)
	
	
	



func _on_path_follow_2d_get_hp_damage(Damage):
	
	HP = HP - Damage;
	print("hihi ich krieg dmg")
	print(HP)
	print(Damage)
	text ="HP:" + str(HP)
