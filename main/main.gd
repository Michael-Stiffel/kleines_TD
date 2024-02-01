extends Node2D

var map_node

var build_mode = false 
var build_valid = false 
var build_location
var build_type

func _ready():
	map_node = get_node("Map_Node/TileMap")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", initiate_build_mode.bind(i.get_name()))

func _process(delta):
	if build_mode:
		update_tower_preview()

func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancle_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
		cancle_build_mode()

func initiate_build_mode(tower_type):
	if build_mode:
		cancle_build_mode()
	build_type = tower_type + "T1" #T1 packen wir hinten dran weil wir prinzipiell immer erstmal einen Tier 1 Tower bauen 
	build_mode = true;
	var tile = get_global_mouse_position() 
	get_node("Build_Menue").set_tower_preview(build_type, tile)

func update_tower_preview():
	var mouse_posi = get_global_mouse_position() 
	var current_tile = map_node.local_to_map(mouse_posi)
	var tile_position = map_node.map_to_local(current_tile)
	get_node("Build_Menue").update_tower_preview(tile_position,"ad54ff3c" )
	build_valid = true
	build_location = tile_position

func cancle_build_mode():
	build_mode = false
	build_valid = false
	get_node("Build_Menue/TowerPreview").free()

func verify_and_build():
	
	var map_dic = map_node.get_MapDic()
	var mapX = map_node.get_MapX()
	var mapY = map_node.get_MapY()
	var new_tower = load("res://"+ build_type +".tscn").instantiate()
	var mouse_posi = get_global_mouse_position() 
	var current_tile = map_node.local_to_map(mouse_posi)
	var tile_position = map_node.map_to_local(current_tile)
	
	if current_tile[0] >= mapX ||  current_tile[1] >= mapY :
		build_valid = false
		return
	
	if map_dic[str(current_tile)]["Buildable"]:
		build_valid = true
	else:
		build_valid = false
		
	if build_valid: # da muss ich noch gucken wie das aussieht mit der live berrechneung 
		new_tower.position = Vector2(build_location.x - 64,build_location.y - 64)
		map_node.add_child(new_tower,true)
		new_tower.fire_ready = true
		map_node.astar_grid.set_point_solid(current_tile, true)
		map_dic[str(current_tile)]["Buildable"] = false
		map_node.calculatePath()
