extends PathFollow2D
signal get_HP_Damage
var HP_Bar 
#das wird irgendwann das ur scripot wie bei Turrets aber jett gerade egal
var stats = preload("res://stats.tscn") 
var blood = preload("res://blood_animation.tscn")
var enemystats
var runSpeed 
var hp 
var attackDamage 
var who_am_i


	

func set_stats(enemy):
	who_am_i = enemy
	enemystats = stats.instantiate().get_enemy_data()
	runSpeed = enemystats[enemy]["speed"]; 
	hp = enemystats[enemy]["health"]; 
	attackDamage = enemystats[enemy]["damage"]; 
	HP_Bar = get_node("Healthbar")
	HP_Bar.max_value = hp
	HP_Bar.value = hp 
	HP_Bar.set_as_top_level (true)
	HP_Bar.set_position(position) 
	loop = false;
	set_progress(0)


func _process(delta):
	move(delta)
		

func move(delta):
	set_progress(get_progress()+runSpeed*delta)
	HP_Bar.set_as_top_level (true)
	HP_Bar.set_position(position- Vector2(16,20)) 
	if (loop == false and progress_ratio == 1):
		get_node("../../../Camera2D/HP_Count")._on_path_follow_2d_get_hp_damage(attackDamage)
		on_destroy()
	if hp <=0:
		on_destroy()
		
func on_hit(damage):
	var newHit= blood.instantiate()
	newHit.position = position
	add_child(newHit)
	hp = hp - damage
	HP_Bar.value = hp 
	
		

func on_destroy():
	self.get_parent().set_enemys_in_wave(1)
	self.queue_free()
	

