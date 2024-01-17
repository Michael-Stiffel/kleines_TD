extends PathFollow2D

@export var runSpeed = 20; 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress = progress+runSpeed*delta
	##progress_ratio += 0.001;
	if (loop == false and progress_ratio == 1): 
		queue_free();
