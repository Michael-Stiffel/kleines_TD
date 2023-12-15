extends TileMap


var GridSizeX = randi_range(8, 30);
var GridSizeY = randi_range(8, 14);
var Dic = {}; 

func _ready():
	var gx = GridSizeX;
	var gy =  GridSizeY;
	print(gx, ",", gy);
	for x in gx:
		for y in gy:
			if x== 0 || y == 0 || x== gx-1 || y== gy-1 :
				Dic[str(Vector2(x,y))] = {
				"Type": "Stone",
				"Koor": str(Vector2(x,y))
			}
				set_cell(0,Vector2(x,y),6, Vector2i(0,0),0);
			
			else:
				Dic[str(Vector2(x,y))] = {
					"Type": "Grass",
					"Koor": str(Vector2(x,y))
				}
				set_cell(0,Vector2(x,y),1, Vector2i(0,0),0);
	setGoalAndStart(gx,gy);
	
	
	print(Dic);
	
	

func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	
	for x in GridSizeX:
		for y in GridSizeY:
			erase_cell(1, Vector2(x,y))
			
	if Dic.has(str(tile)):
		set_cell(1, tile, 4, Vector2i(0,0),0)
		print(Dic[str(tile)])

func setGoalAndStart(x,y):
	var StartPoint = Vector2(randi_range(1,x-2),randi_range(1,y-2))
	var EndPoint = Vector2(randi_range(1,x-2),randi_range(1,y-2))
	print("ICH BIN DER START", StartPoint)
	set_cell(2,StartPoint,0, Vector2i(0,0),0);
	set_cell(2,EndPoint,5, Vector2i(0,0),0);
	
