extends Area2D
signal ACTIVATE


func _on_body_entered(body: Node2D) -> void:
	emit_signal("ACTIVATE")
