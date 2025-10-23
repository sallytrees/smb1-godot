extends Camera2D
signal activate


func _physics_process(delta: float) -> void:
	pass


func _on_activate_body_entered(body: Node2D) -> void:
	if body.has_method("activate"):
		body.activate()


func _on_activate_body_exited(body: Node2D) -> void:
	if body.has_method("deactivate"):
		body.deactivate()


func _on_delete_body_entered(body: Node2D) -> void:
	body.queue_free()
