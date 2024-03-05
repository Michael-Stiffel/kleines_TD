extends TextureButton



func _on_mouse_entered():
	$"../../HBoxContainer4/Tooltipp".text = "Verbessere deine Tech-Stufe"
	$"../../HBoxContainer4/Tooltipp".visible = true
func _on_mouse_exited():
	$"../../HBoxContainer4/Tooltipp".visible = false
