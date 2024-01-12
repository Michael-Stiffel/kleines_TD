extends Path2D 
 

var PathPoints;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
		
	pass
	



func _on_tile_map_path_calculated(Message):
	PathPoints = Message;
	curve.clear_points()
	for x in PathPoints:
		curve.add_point(x*64)
	pass # Replace with function body.
