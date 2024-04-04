extends TextureButton
var stats = preload("res://stats.tscn")
var towerData = stats.instantiate().get_tower_data()
var build_type

func _on_mouse_entered():
	$"../../HBoxContainer4/Tooltipp".text = "Grundplatte für Kämpfer(" + str(towerData[build_type]["cost"]) +")"
	$"../../HBoxContainer4/Tooltipp".visible = true
func _on_mouse_exited():
	$"../../HBoxContainer4/Tooltipp".visible = false
func change_build_type(new_build_type):
	build_type = new_build_type
