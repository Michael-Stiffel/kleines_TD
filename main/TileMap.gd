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
	
	Map_Marker_Start_and_Goal= setGoalAndStart(gx,gy, astar_grid);
	start_cell = Map_Marker_Start_and_Goal[0];
	end_cell = Map_Marker_Start_and_Goal[1];
	calculatePath();

	

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
	#"path.clear()"
	
	
	var id_path = astar_grid.get_id_path(start_cell, end_cell) 
	
	var gx = GridSizeX;
	var gy =  GridSizeY;
	
	for x in gx:
		for y in gy:
			if x== 0 || y == 0 || x== gx-1 || y== gy-1 :
				set_cell(0,Vector2(x,y),6, Vector2i(0,0),0);	
			else:
				set_cell(0,Vector2(x,y),1, Vector2i(0,0),0);


	for id in id_path:
		set_cell(0, id, 2, Vector2(0, 0),0)
	emit_signal("PathCalculated", id_path )
	#print("DER PFAD ZWISCHEN START UND ZIEL MF##########################################################")
	#print(astar_grid.get_id_path(Map_Marker_Start_and_Goal[0],Map_Marker_Start_and_Goal[1])) 
	#print(astar_grid.get_point_path(Map_Marker_Start_and_Goal[0],Map_Marker_Start_and_Goal[1])) 
