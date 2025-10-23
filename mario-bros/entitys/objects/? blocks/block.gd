extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("negativebounce"):
		body.negativebounce()
		queue_free()
func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shin")
