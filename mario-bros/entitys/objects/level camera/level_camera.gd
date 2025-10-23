extends Area2D
var MOVE = 0
var SPEED = 70
var VELOCITY = 0

func _physics_process(delta: float) -> void:
	if MOVE == 1:
		$"..".position.x += SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	MOVE  = 1


func _on_body_exited(body: Node2D) -> void:
	MOVE = 0
