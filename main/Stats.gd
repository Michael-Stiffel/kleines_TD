extends Node 

var enemy_data={
	"Schabe":{
		"damage" : 1,
		"health": 20,
		"speed" : 100,
		"cost" : 1
 	},
	"Golem":{
		"damage" : 2,
		"health": 100,
		"speed" : 60,
		"cost" : 3
	},
	"Slime":{
		"damage" : 1,
		"health": 80,
		"speed" : 80,
		"cost" : 2
	}
}


var tower_data ={
	"TurretT1":{
		"damage": 10,
		"range" : 200,
		"attackspeed" : 1 # 1 mal pro sekunde
		
	},
	"CavemanTower":{
		"damage": 30,
		"range" : 100,
		"attackspeed" : 2 # 1 mal pro 2 skeunden 
	},
}

func get_tower_data():
	return tower_data

func get_enemy_data():
	return enemy_data
