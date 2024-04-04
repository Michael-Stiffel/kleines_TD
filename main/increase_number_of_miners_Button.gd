extends TextureButton
var text = ""
var mouse_in = false
func _prozess():
	$"../../HBoxContainer4/Tooltipp".text = text

func _on_mouse_entered():
	$"../../HBoxContainer4/Tooltipp".text = text
	$"../../HBoxContainer4/Tooltipp".visible = true
	mouse_in = true
	
	
func _on_mouse_exited():
	$"../../HBoxContainer4/Tooltipp".visible = false
	mouse_in = false

func change_text(new_text):
	text = new_text
	if mouse_in:
		$"../../HBoxContainer4/Tooltipp".visible = false
		$"../../HBoxContainer4/Tooltipp".text = text
		$"../../HBoxContainer4/Tooltipp".visible = true
