extends Label
var wave
var GameOverScreen = preload("res://Game_over_screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	wave = 0;
	text = "WELLE:" + str(wave)  


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text ="WELLE:" + str(wave)  
	if wave >= 10:
		var gameover = GameOverScreen.instantiate()
		add_child(gameover)
		gameover.set_title(true) # hier wird der Winstate gesetzt im Moment ist das Ziel Welle 10 zu schaffen
		get_tree().paused = true
		

func set_new_wave(new_wave):
	wave = new_wave
