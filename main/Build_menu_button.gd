extends TextureButton



func _on_mouse_entered():
	$"../../HBoxContainer4/Tooltipp".text = "BAU SHIT MIAU"
	$"../../HBoxContainer4/Tooltipp".visible = true
func _on_mouse_exited():
	$"../../HBoxContainer4/Tooltipp".visible = false
