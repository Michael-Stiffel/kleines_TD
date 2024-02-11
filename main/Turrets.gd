extends Node2D

var enemy_array = []
var enemy 
var stats = preload("res://stats.tscn") 
var towerData = stats.instantiate().get_tower_data()
var fire_ready = false
var Trange 
var Tdamage
var Tattackspeed

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
	enemy.on_hit(Tdamage)
	await get_tree().create_timer(Tattackspeed).timeout
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
