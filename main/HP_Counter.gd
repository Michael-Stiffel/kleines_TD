extends Label
var HP;

var GameOverScreen = preload("res://Game_over_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	HP = 2;
	text ="HP:" + str(HP)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text ="HP:" + str(HP)
	if HP == 0:
		var gameover = GameOverScreen.instantiate()
		add_child(gameover)
		gameover.set_title(false)
		get_tree().paused = true
	
	



func _on_path_follow_2d_get_hp_damage(Damage):
	
	HP = HP - Damage;
	print("hihi ich krieg dmg")
	print(HP)
	print(Damage)
	text ="HP:" + str(HP)
