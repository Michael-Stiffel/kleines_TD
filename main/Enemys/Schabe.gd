
extends PathFollow2D
signal get_HP_Damage
var HP_Bar 
#das wird irgendwann das ur scripot wie bei Turrets aber jett gerade egal
var stats = preload("res://stats.tscn") 
var enemystats
var runSpeed 
var hp 
var attackDamage 


func set_stats(enemy):
	enemystats = stats.instantiate().get_enemy_data()
	runSpeed = enemystats[enemy]["speed"]; 
	hp = enemystats[enemy]["health"]; 
	attackDamage = enemystats[enemy]["damage"]; 
	HP_Bar = get_node("Healthbar")
	HP_Bar.max_value = hp
	HP_Bar.value = hp 
	HP_Bar.set_as_top_level (true)
	HP_Bar.set_position(position- Vector2(16,20)) 

func _ready():
	set_stats("Schabe")
	loop = false;
	set_progress(0)



func _process(delta):
	move(delta)
		

func move(delta):
	set_progress(get_progress()+runSpeed*delta)
	HP_Bar.set_as_top_level (true)
	HP_Bar.set_position(position- Vector2(16,20)) 
	if (loop == false and progress_ratio == 1):
		get_node("../../../Camera2D/HP_Count")._on_path_follow_2d_get_hp_damage(1)
		queue_free();
		
func on_hit(damage):
	hp -= damage
	HP_Bar.value = hp 
	if hp <=0:
		on_destroy()
		

func on_destroy():
	self.queue_free()
	
