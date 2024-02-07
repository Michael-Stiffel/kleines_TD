extends Path2D 
 
var timer = 0;
var spawnTime = 1; 
#var follower = preload("res://Enemy_Follow_Path.tscn")
#var follower = preload("res://Enemys/Schabe.tscn")
var PathPoints;
var current_wave = 0
var enemys_in_wave = 0 
var READY = false
var Startbutton
# Called when the node enters the scene tree for the first time.

func _ready():
	Startbutton = get_tree().get_nodes_in_group("Startbutton")
	Startbutton[0].connect("pressed", set_READY.bind())
	
func set_READY():
	READY = true

func set_enemys_in_wave(value):
	enemys_in_wave = enemys_in_wave -value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(enemys_in_wave)
	if READY && enemys_in_wave == 0 :
		await start_next_wave()
		READY = false
	
	#timer = timer + delta; 
	
	#if (timer > spawnTime):
	#	var newFollower = follower.instantiate()
	#	add_child(newFollower)
	#	timer = 0; 
	

func _on_tile_map_path_calculated(Message):
	PathPoints = Message;
	#print(Message);
	curve.clear_points()
	for x in PathPoints:
		curve.add_point((x*64) + (Vector2i(32,32)))
	pass # Replace with function body.


##Wave funktionen 

func start_next_wave():
	var wave_data = retrieve_wave_data()
	await get_tree().create_timer(1).timeout
	spawn_enemie(wave_data)

func retrieve_wave_data():
	var wave_data = [["Golem"],["Golem"],["Golem"], ["Schabe"],["Schabe"],["Schabe"],["Schabe"]]
	current_wave+= 1
	enemys_in_wave = wave_data.size()
	return wave_data

func spawn_enemie(wave_data):
	for enemy in wave_data:
		var new_enemy = load("res://Enemys/"+ enemy[0]+ ".tscn").instantiate()
		add_child(new_enemy,true)
		await get_tree().create_timer(1).timeout
