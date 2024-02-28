extends Node2D

var map_node
var preview_node
var build_mode = false 
var build_valid = false 
var build_location
var build_type
var Path_node
var not_in_wave = true 
var stats = preload("res://stats.tscn")
var towerData = stats.instantiate().get_tower_data()

func _ready():
	map_node = get_node("Map_Node/TileMap")
	preview_node = get_node("Build_Menue")
	Path_node = get_node("Map_Node/Path2D")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", initiate_build_mode.bind(i.get_name()))

func _process(delta):
	if Path_node.get_enemys_in_wave() != 0:
		if build_mode:
			cancle_build_mode()
		not_in_wave = false 
		build_valid = false
	else:
		not_in_wave = true 
	if build_mode:
		update_tower_preview()

func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancle_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
		#cancle_build_mode()



##Bauen und path checken 

func initiate_build_mode(tower_type):
	if build_mode:
		cancle_build_mode()
	if not_in_wave:
		build_type = tower_type + "T1" #T1 packen wir hinten dran weil wir prinzipiell immer erstmal einen Tier 1 Tower bauen 
		build_mode = true;
		var tile = get_global_mouse_position() 
		get_node("Camera2D/Build_Menue").set_tower_preview(build_type, tile)

func update_tower_preview():
	var mouse_posi = get_global_mouse_position() 
	var current_tile = map_node.local_to_map(mouse_posi)
	var tile_position = map_node.map_to_local(current_tile)
	var map_dic = map_node.get_MapDic()
	var mapX = map_node.get_MapX()
	var mapY = map_node.get_MapY()
	var zu_teuer = get_node("Camera2D/Material").to_expensive(towerData[build_type]["cost"])
	
	
	
	if(current_tile[0] <0  ||  current_tile[1] <0):
		get_node("Camera2D/Build_Menue").update_tower_preview(tile_position,Color(0.862745, 0.0784314, 0.235294, 1))
		return
	if (current_tile[0] >= mapX ||  current_tile[1] >= mapY) || !map_dic[str(current_tile)]["Buildable"] :
		build_valid = false
		get_node("Camera2D/Build_Menue").update_tower_preview(tile_position,Color(0.862745, 0.0784314, 0.235294, 1))
		return
	
	map_node.astar_grid.set_point_solid(current_tile, true)
	if map_node.astar_grid.get_id_path(map_node.get_start_cell(), map_node.get_end_cell()).is_empty() :
		map_node.astar_grid.set_point_solid(current_tile, false)
		get_node("Camera2D/Build_Menue").update_tower_preview(tile_position,Color(0.862745, 0.0784314, 0.235294, 1))
		build_valid = false
	else:
		if current_tile[0] < mapX &&  current_tile[1] < mapY :
			if map_dic[str(current_tile)]["Buildable"]:
				map_node.astar_grid.set_point_solid(current_tile, false)
		get_node("Camera2D/Build_Menue").update_tower_preview(tile_position,Color(0, 1, 1, 1) )
		build_valid = true
		build_location = tile_position
	if zu_teuer:
		get_node("Camera2D/Build_Menue").update_tower_preview(tile_position,Color(0.862745, 0.0784314, 0.235294, 1))
		build_valid = false;

func cancle_build_mode():
	build_mode = false
	build_valid = false
	get_node("Camera2D/Build_Menue/TowerPreview").free()

func verify_and_build():
	
	
		
	if build_valid:
		var map_dic = map_node.get_MapDic()
		var mapX = map_node.get_MapX()
		var mapY = map_node.get_MapY()
		var new_tower = load("res://"+ build_type +".tscn").instantiate()
		var mouse_posi = get_global_mouse_position() 
		var current_tile = map_node.local_to_map(mouse_posi)
		var tile_position = map_node.map_to_local(current_tile) # da muss ich noch gucken wie das aussieht mit der live berrechneung 
		get_node("Camera2D/Material").buy_shit(towerData[build_type]["cost"])
		map_node.astar_grid.set_point_solid(current_tile, true)
		map_node.calculatePath()
		new_tower.position = Vector2(build_location.x - 64,build_location.y - 64)
		map_node.add_child(new_tower,true)
		new_tower.fire_ready = true
		new_tower.tile_position = current_tile
		new_tower.map = map_node
		map_dic[str(current_tile)]["Buildable"] = false
		
