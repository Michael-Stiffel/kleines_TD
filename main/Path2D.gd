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
var stats = preload("res://stats.tscn")
var enemystats 
# Called when the node enters the scene tree for the first time.

func _ready():
	Startbutton = get_tree().get_nodes_in_group("Startbutton")
	Startbutton[0].connect("pressed", set_READY.bind())
	enemystats = stats.instantiate().get_enemy_data()
	
func set_READY():
	READY = true

func set_enemys_in_wave(value):
	enemys_in_wave = enemys_in_wave - value
	
func get_enemys_in_wave():
	get_node("../../Camera2D/Enemies_left").set_enemies_left(enemys_in_wave)
	if enemys_in_wave == 0:
		get_node("../../Camera2D/Enemies_left").set_wave_state("Ende")
	return enemys_in_wave

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(enemys_in_wave)
	if enemys_in_wave != 0:
		READY = false
	if READY && enemys_in_wave == 0 :
		READY = false
		start_next_wave()
		get_node("../../Camera2D/Enemies_left").set_wave_state("Start")


func _on_tile_map_path_calculated(Message):
	PathPoints = Message;
	#print(Message);
	curve.clear_points()
	$Line2D.clear_points()
	for x in PathPoints:
		curve.add_point((x*64) + (Vector2i(32,32)))
		$Line2D.add_point((x*64) + (Vector2i(32,32)))

##Wave funktionen 

func start_next_wave():
	var wave_data = retrieve_wave_data()
	await get_tree().create_timer(1).timeout
	spawn_enemie(wave_data)

func retrieve_wave_data():
	current_wave+= 1
	var wave_data = gimme_the_waves()
	get_node("../../Camera2D/Current_Wave").set_new_wave(current_wave)
	enemys_in_wave = wave_data.size()
	return wave_data

func spawn_enemie(wave_data):
	for enemy in wave_data:
		var new_enemy = load("res://Enemys/"+ enemy+ ".tscn").instantiate()
		add_child(new_enemy,true)
		await get_tree().create_timer(1).timeout

func gimme_the_waves():
	var choosen_enemy = enemystats.keys()[randi_range(0, 2)]
	var cost_of_enemy = enemystats[choosen_enemy]["cost"]
	var number_of_enemys = int((current_wave*10)/ enemystats[choosen_enemy]["cost"])
	get_node("../../Camera2D/Enemies_left").set_initial_enemies_left(number_of_enemys)
	var da_waves = []
	for  i in number_of_enemys:
		da_waves.append(choosen_enemy)
	#var da_waves = [["Golem"],["Golem"],["Golem"], ["Schabe"],["Schabe"],["Slime"],["Slime"]]
	return da_waves
