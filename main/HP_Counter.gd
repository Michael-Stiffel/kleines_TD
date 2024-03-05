extends Label
var HP;

var GameOverScreen = preload("res://Game_over_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	HP = 100;
	text ="HP:" + str(HP)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text ="HP:" + str(HP)
	if HP >= 50:
		set("theme_override_colors/font_color",Color("00ff00"))
	elif HP > 25 && HP < 50:
		set("theme_override_colors/font_color",Color("e6ff00"))
	elif HP < 25:
		set("theme_override_colors/font_color",Color("ff0000"))
	
	
	if HP <= 0:
		var gameover = GameOverScreen.instantiate()
		add_child(gameover)
		gameover.set_title(false)
		get_tree().paused = true
		
	



func _on_path_follow_2d_get_hp_damage(Damage):
	
	HP = HP - Damage;
	#print("hihi ich krieg dmg")
	#print(HP)
	#print(Damage)
	text ="HP:" + str(HP)
