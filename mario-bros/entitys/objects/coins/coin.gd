extends Node2D


func _on_collect_body_entered(body: Node2D) -> void:
	queue_free()
