extends TileMap

signal PathCalculated

var GridSizeX = randi_range(8, 30);
var GridSizeY = randi_range(8, 14);
var Dic = {}; 
var Map_Marker_Start_and_Goal;
var cell_size =Vector2i(64, 64);
var astar_grid = AStarGrid2D.new()
var start_cell
var end_cell

func get_MapDic():
	return Dic

func get_MapX():
	return GridSizeX
	
func get_MapY():
	return GridSizeY

func get_start_cell():
	return start_cell

func get_end_cell():
	return end_cell
	
func _ready():
	var gx = GridSizeX;
	var gy =  GridSizeY;
	#print(gx, ",", gy);
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_AT_LEAST_ONE_WALKABLE
	astar_grid.region = Rect2i(0, 0, gx, gy);
	astar_grid.cell_size = cell_size;
	astar_grid.offset = cell_size / 2;
	astar_grid.update();
	## Build the initial Map.
	## First the Stone Border and then the Gras:
	for x in gx:
		for y in gy:
			if x== 0 || y == 0 || x== gx-1 || y== gy-1 :
				Dic[str(Vector2(x,y))] = {
				"Type": "Stone",
				"Koor": str(Vector2(x,y)),
				"Buildable" : false 
				}
				astar_grid.set_point_solid(Vector2i(x, y), true)
				set_cell(0,Vector2(x,y),6, Vector2i(0,0),0);
				
			
			else:
				Dic[str(Vector2(x,y))] = {
					"Type": "Grass",
				"Koor": str(Vector2(x,y)),
				"Buildable" : true
				}
				set_cell(0,Vector2(x,y),1, Vector2i(0,0),0);
	##Then drop the Goal and the Startpoint:
	Map_Marker_Start_and_Goal= setGoalAndStart(gx,gy, astar_grid);
	start_cell = Map_Marker_Start_and_Goal[0];
	end_cell = Map_Marker_Start_and_Goal[1];
	setStonesOnMap();
	calculatePath();
	addBoosters()
	##TODO: Now set in the extras like Stones, Barikades, Boosters etc.

	

func _process(_delta):
	var tile = local_to_map(get_global_mouse_position())

	
	for x in GridSizeX:
		for y in GridSizeY:
			erase_cell(1, Vector2(x,y))
			
	if Dic.has(str(tile)):
		set_cell(1, tile, 4, Vector2i(0,0),0)
		#"print(Dic[str(tile)])"
		#print(tile)
		#print(astar_grid.is_point_solid(Vector2i(tile)));
		#print(Dic[str(tile)])
		

func setGoalAndStart(x,y,_astar_grid):
	var StartPoint = Vector2(randi_range(1,x-2),randi_range(1,y-2))
	var EndPoint = Vector2(randi_range(1,x-2),randi_range(1,y-2))
	#print("ICH BIN DER START", StartPoint)
	set_cell(2,StartPoint,0, Vector2i(0,0),0);
	Dic[str(StartPoint)] = {
				"Type": "Start",
				"Koor": str(StartPoint),
				"Buildable" : false 
			}
	set_cell(2,EndPoint,5, Vector2i(0,0),0);
	Dic[str(EndPoint)] = {
				"Type": "Ziel",
				"Koor": str(EndPoint),
				"Buildable" : false 
			}
	return [StartPoint, EndPoint];
	
	
func calculatePath():
	var id_path = astar_grid.get_id_path(start_cell, end_cell) 
	
	var gx = GridSizeX;
	var gy =  GridSizeY;
	
	for x in gx:
		for y in gy:
			if x== 0 || y == 0 || x== gx-1 || y== gy-1 :
				set_cell(0,Vector2(x,y),6, Vector2i(0,0),0);	
			else:
				match Dic[str(Vector2(x,y))]["Type"]:
					"Grass":
						set_cell(0,Vector2(x,y),1, Vector2i(0,0),0);
					"Stone-Baricade":
						set_cell(0,Vector2(x,y),7, Vector2i(0,0),0);
				


	for id in id_path:
		set_cell(0, id, 2, Vector2(0, 0),0)
	emit_signal("PathCalculated", id_path )
	#print("DER PFAD ZWISCHEN START UND ZIEL MF##########################################################")
	#print(astar_grid.get_id_path(Map_Marker_Start_and_Goal[0],Map_Marker_Start_and_Goal[1])) 
	#print(astar_grid.get_point_path(Map_Marker_Start_and_Goal[0],Map_Marker_Start_and_Goal[1])) 

func setStonesOnMap():
	var numberOfTiles = (GridSizeX-2) * (GridSizeY-2)
	var numberOfStoneBaricades  = randi_range(2, int(numberOfTiles/3));
	for i in numberOfStoneBaricades:
		var randomX = randi_range(1,GridSizeX-1)
		var randomY = randi_range(1,GridSizeY-1)
		if Dic[str(Vector2(randomX,randomY))]["Type"] == "Grass":
			astar_grid.set_point_solid(Vector2i(randomX, randomY), true)
			#Bevor der Stein wirklich gesetzt wird, wird geguckt ob der pfad überhaupt entstehen kann
			if astar_grid.get_id_path(get_start_cell(), get_end_cell()).is_empty() :
				astar_grid.set_point_solid(Vector2i(randomX, randomY), false)
			else:
				Dic[str(Vector2(randomX,randomY))] = {
					"Type": "Stone-Baricade",
					"Koor": str(Vector2(randomX,randomY)),
					"Buildable" : false 
					}	
				set_cell(0,Vector2(randomX,randomY),7, Vector2i(0,0),0);
		else:
			numberOfStoneBaricades +1	
	#Das +1 agiert als reroll, sollte also irgendedetwas anderes als ein Grasblock als Ziel gewählt 
	#werden dann wird der Nummer an Baricades einer hinzugefügt und sonst nichts getan
		
		

func addBoosters():
	var numberOfTiles = (GridSizeX-2) * (GridSizeY-2)
	var numberOfBoosters = randi_range(1, int(numberOfTiles/50));
	for i in numberOfBoosters:
		var booster = load("res://booster.tscn").instantiate()
		var randomX = randi_range(1,GridSizeX-2)
		var randomY = randi_range(1,GridSizeY-2)
		var current_tile = Vector2i(randomX,randomY)
		var tile_position = self.map_to_local(current_tile)
		booster.set_position(tile_position)
		self.add_child(booster,true)	
