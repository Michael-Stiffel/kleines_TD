extends CanvasLayer


func  set_tower_preview(build_type, mouse_position):
	
	var drag_tower = load("res://"+ build_type +".tscn").instantiate()
	drag_tower.set_name("Drag_Tower")
	drag_tower.modulate = Color("ad54ff3c");
	var control = Control.new()
	control.add_child(drag_tower,true)
	control.position = mouse_position
	control.set_name("TowerPreview")
	add_child(control,true)
	move_child(get_node("TowerPreview"), 0)
	
	
func update_tower_preview(new_position, color):
	get_node("TowerPreview").position = new_position
	if get_node("TowerPreview/Drag_Tower").modulate != Color(color):
		get_node("TowerPreview/Drag_Tower").modulate = Color(color)
	