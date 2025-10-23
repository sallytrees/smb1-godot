extends StaticBody2D


#func _on_break_body_entered(body: Node2D) -> void:
#	if body.has_method("negativebounce"):
#		body.negativebounce()
#		queue_free()

func destroy():
	queue_free()
