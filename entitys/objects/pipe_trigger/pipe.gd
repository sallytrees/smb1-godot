extends Area2D
@export var SIDE = 0

func _on_body_entered(body: Node2D) -> void:
	if SIDE == 0:
		Global.PIPE = 1
	else: Global.SIDE_PIPE = 1


func _on_body_exited(body: Node2D) -> void:
	if SIDE == 0:
		Global.PIPE = 0
	else: Global.SIDE_PIPE = 0
