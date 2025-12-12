extends Area2D
var SPAWNED = 0
@export var ENTITY = load("res://scenes/MyScene.tscn")


func _on_body_entered(body: Node2D) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	var ENTITYINSTANCE = ENTITY.instantiate()
	ENTITYINSTANCE.set_name("entity")
	if SPAWNED == 0:
		add_child(ENTITYINSTANCE)
	SPAWNED = 1
