extends Node 

var enemy_data={
	"Schabe":{
		"damage" : 1,
		"health": 2000,
		"speed" : 100
	},
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
