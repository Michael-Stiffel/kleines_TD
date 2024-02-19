extends Node2D
var speed = 1200
var TDamage
var time = 0


func _process(delta):
	position += transform.x * speed * delta
	time += delta
	if time > 5:
		queue_free()
		
func my_damage(damage):
	TDamage = damage

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body.get_parent().get_parent().on_hit(TDamage))
	queue_free() # Replace with function body.
