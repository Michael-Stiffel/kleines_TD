extends Node2D
var BosterRange 
var range_texture
var effect 
var EffectStrength
# Called when the node enters the scene tree for the first time.
func _ready():
	#$Area2D/CollisionShape2D.get_shape().radius =  range
	RandomiseBasicallyAnything()
	
	
	


func _process(delta):
	pass



func _on_area_2d_area_entered(area):

	if area.name == "Click_body":
		match effect:
			"ASP":
				var targetASP = area.get_parent().Tattackspeed 
				var newASP = targetASP * EffectStrength/100.0
				area.get_parent().Tattackspeed = newASP
				
			"ATK":
				var targetATK = area.get_parent().Tdamage 
				var newATK = targetATK * EffectStrength/100.0
				area.get_parent().Tdamage = newATK
				
			"TRANGE":
				var targetTrange = area.get_parent().Trange 
				var newTrange = targetTrange * EffectStrength/100
				area.get_parent().Trange = newTrange
				
		

func _on_area_2d_area_exited(area):

	if area.name == "Click_body":
		match effect:
				"ASP":
					var targetASP = area.get_parent().Tattackspeed 
					var newASP = targetASP / EffectStrength/100.0
					area.get_parent().Tattackspeed = newASP
					
				"ATK":
					var targetATK = area.get_parent().Tdamage 
					var newATK = (targetATK * 100.0	)/ EffectStrength
					area.get_parent().Tdamage = newATK
					
				"TRANGE":
					var targetTrange = area.get_parent().Trange 
					var newTrange = (targetTrange * 100.0	)/ EffectStrength
					area.get_parent().Trange = newTrange
					area.get_parent().get_node("Area2D/CollisionShape2D").get_shape().radius =  area.get_parent().Trange


func RandomiseBasicallyAnything():
	BosterRange = randi_range(100,500)
	var EffectList = ["ASP", "ATK", "TRANGE"]
	effect = EffectList[randi_range(0,2)]
	EffectStrength = randi_range(10,300)
	range_texture =  Sprite2D.new()	
	range_texture.position = Vector2(64,64)
	self.get_node("Area2D/CollisionShape2D").get_shape().radius =  BosterRange
	var scaling = BosterRange/ 300.0
	range_texture.scale = Vector2(scaling,scaling)
	var texture = load("res://res/PNG/range_overlay.png")
	range_texture.texture = texture
	match effect:
			"ASP":
				range_texture.modulate = Color(1, 1, 0, 1)
				
			"ATK":
				range_texture.modulate = Color(0.545098, 0, 0, 1)
				
			"TRANGE":
				range_texture.modulate = Color("ad54ff3c")	
	
	$Label.text = "Booster: " + str(effect) +" : "+ str(EffectStrength) + "%"
	self.add_child(range_texture)
	




