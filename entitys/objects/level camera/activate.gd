extends Camera2D
signal activate

func _ready() -> void:
	$world2.text = Global.LEVELNUMBER

func _physics_process(delta: float) -> void:
	$time2.text = str(int(Global.LEVEL_TIMER))
	$coins.text = str(int(Global.COINS))
	$score.text = str(int(Global.SCORE))
func _on_activate_body_entered(body: Node2D) -> void:
	if body.has_method("activate"):
		body.activate()


func _on_activate_body_exited(body: Node2D) -> void:
	if body.has_method("deactivate"):
		body.deactivate()


func _on_delete_body_entered(body: Node2D) -> void:
	body.queue_free()


func _on_entityloader_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
