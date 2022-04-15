extends Area2D



func _on_star_body_entered(body):
	if body.name == "packman":
		queue_free()
