extends StaticBody2D
var BREAK = 0

#func _on_break_body_entered(body: Node2D) -> void:
#	if body.has_method("negativebounce"):
#		body.negativebounce()
#		queue_free()

func destroy():
	BREAK = 1
	queue_free()
	Global.SCORE += 200
func block():
	pass

func _ready() -> void:
	if Global.LEVELTHEME == 1:
		$Sprite2D.frame = 68


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("shell_death") and BREAK == 1:
		body.shell_death()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("shell_death") and BREAK == 1:
		body.shell_death()
