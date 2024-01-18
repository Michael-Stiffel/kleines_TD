@tool
extends PathFollow2D
signal get_HP_Damage
@export var runSpeed = 100; 


# Called when the node enters the scene tree for the first time.
func _ready():
	loop = false;
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress = progress+runSpeed*delta
	##progress_ratio += 0.001;
	if (loop == false and progress_ratio == 1):
		get_node("../../../Camera2D/HP_Count")._on_path_follow_2d_get_hp_damage(1)
		queue_free();
		
