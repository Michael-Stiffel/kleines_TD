extends CanvasLayer

var stats = preload("res://stats.tscn") 
var towerData = stats.instantiate().get_tower_data()


func  set_tower_preview(build_type, mouse_position):
	var Trange = towerData[build_type]["range"]
	var drag_tower = load("res://"+ build_type +".tscn").instantiate()
	drag_tower.set_name("Drag_Tower")
	drag_tower.modulate = Color("ad54ff3c");
	
	var range_texture =  Sprite2D.new()	
	range_texture.position = Vector2(64,64)
	var scaling = Trange/ 300.0
	range_texture.scale = Vector2(scaling,scaling)
	var texture = load("res://res/PNG/range_overlay.png")
	range_texture.texture = texture
	range_texture.modulate = Color("ad54ff3c")
	
	var control = Control.new()
	control.add_child(drag_tower,true)
	control.add_child(range_texture,true)
	control.position = mouse_position
	control.set_name("TowerPreview")
	add_child(control,true)
	move_child(get_node("TowerPreview"), 0)
	
	
func update_tower_preview(new_position, color):
	get_node("TowerPreview").position = new_position
	if get_node("TowerPreview/Drag_Tower").modulate != Color(color):
		get_node("TowerPreview/Drag_Tower").modulate = Color(color)
		get_node("TowerPreview/Sprite2D").modulate = Color(color)
