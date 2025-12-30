extends Area2D
@export var LEVEL = "res://levels/1-1/1_1.tscn"

func _on_area_entered(area: Area2D) -> void:
	Global.NEXT_LEVEL = LEVEL
	print("COLLIDER")
