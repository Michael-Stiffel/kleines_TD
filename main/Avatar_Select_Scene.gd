extends AnimatedSprite2D
var user_prefs: UserPreferences

# Called when the node enters the scene tree for the first time.
func _ready():
	self.play(self.name)
	user_prefs = UserPreferences.load_or_create()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func _on_play_pressed():
	var name = self.name
	user_prefs.Nation = name
	user_prefs.save()
	get_tree().change_scene_to_file("res://main.tscn")






