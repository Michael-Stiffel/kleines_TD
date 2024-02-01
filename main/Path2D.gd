extends Path2D 
 
var timer = 0;
var spawnTime = 1; 
var follower = preload("res://Enemy_Follow_Path.tscn")
var PathPoints;
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta; 
	
	if (timer > spawnTime):
		var newFollower = follower.instantiate()
		add_child(newFollower)
		timer = 0; 
	

func _on_tile_map_path_calculated(Message):
	PathPoints = Message;
	#print(Message);
	curve.clear_points()
	for x in PathPoints:
		curve.add_point((x*64) + (Vector2i(32,32)))
	pass # Replace with function body.
