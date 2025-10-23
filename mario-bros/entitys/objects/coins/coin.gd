extends Node2D

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shin")
func _on_collect_body_entered(body: Node2D) -> void:
	queue_free()
