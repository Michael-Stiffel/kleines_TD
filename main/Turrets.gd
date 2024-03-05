extends Node2D

var map
var tile_position
var enemy_array = []
var enemy 
var stats = preload("res://stats.tscn") 
var towerData = stats.instantiate().get_tower_data()
var fire_ready = false
var Trange 
var Tdamage
var Tattackspeed
var Arrow = preload("res://arrow.tscn")
var button = 0 

	
func _process(_delta):
	if enemy_array.size() != 0:
		select_enemy()
		if fire_ready:
			fire()
	

func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(int(i.progress))
	var max_progress = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_progress)
	enemy = enemy_array[enemy_index]
	#print("Choosen enemy: ")
	#print(enemy)


func fire():
	
	fire_ready = false
	var b = Arrow.instantiate()
	add_child(b)
	b.my_damage(Tdamage)
	b.position.x = b.position.x+64
	b.position.y = b.position.y+64
	var degree = b.get_angle_to(enemy.position)
	b.transform = b.transform.rotated_local(degree)  
	#enemy.on_hit(Tdamage)
	await get_tree().create_timer(1/Tattackspeed).timeout
	fire_ready = true
	
	
func _on_area_2d_body_entered(body):
	enemy_array.append((body.get_parent()).get_parent())
	
	

func _on_area_2d_body_exited(body):
	enemy_array.erase((body.get_parent()).get_parent())

func intialfuck(name):
	Trange = towerData[name]["range"]
	self.get_node("Area2D/CollisionShape2D").get_shape().radius =  Trange
	Tdamage = towerData[name]["damage"]
	Tattackspeed = towerData[name]["attackspeed"]

func upgrade_ATK(value):
		Tdamage = Tdamage + value
		
func upgrade_ASP(value):
		Tattackspeed = Tattackspeed + value
