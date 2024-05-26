extends AnimatedSprite2D
@onready var HP_Count = %HP_Count
@onready var Build_Menue = $"../../../Build_Menue"
var which_sprites_to_play = ["100", "75", "50", "25", "0"]
var GameOverScreen = preload("res://Game_over_screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.play(which_sprites_to_play[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var HP = HP_Count.get_HP()
	if(HP>75):
		self.play(which_sprites_to_play[0])
	elif (HP<=75 && HP>50):
		self.play(which_sprites_to_play[1])
	elif (HP<=50 && HP>25):
		self.play(which_sprites_to_play[2])
	elif (HP<=25 && HP>0):
		self.play(which_sprites_to_play[3])
	elif (HP<=0):
		self.play(which_sprites_to_play[4])
		await get_tree().create_timer(1).timeout
		var gameover = GameOverScreen.instantiate()
		Build_Menue.visible = false
		add_child(gameover)
		gameover.set_title(false)
		get_tree().paused = true
