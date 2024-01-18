extends Node2D
signal HP_Count 
var HP ;
# Called when the node enters the scene tree for the first time.
func _ready():
	HP = 100;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	HP = HP


func get_HP_Damage(Damage):
	HP = HP-Damage; 
	print("meine HP sind : ")
	print(HP)
	emit_signal("HP_Count",HP);

