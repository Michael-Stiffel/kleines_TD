extends Node 

var enemy_data={
	"T1":{
		"Schabe":{
		"damage" : 5,
		"health": 20,
		"speed" : 100,
		"cost" : 1
 		},
	
	"Slime":{
		"damage" : 5,
		"health": 80,
		"speed" : 80,
		"cost" : 2
		},
	
	},
	"T2":{
		"Golem":{
		"damage" : 5,
		"health": 100,
		"speed" : 60,
		"cost" : 3
	},
	}, 
}


var tower_data ={
	"TurretT1":{
		"damage": 10,
		"range" : 200,
		"attackspeed" : 1, # 1 mal pro sekunde
		"cost" : 5
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
