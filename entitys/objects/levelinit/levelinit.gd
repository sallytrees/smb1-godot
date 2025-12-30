extends Node2D

@export var LEVELTHEME = 0
@export var CAM_SCROLL = 1
@export var LEVELNUMBER = "1-1"

func _ready() -> void:
	Global.LEVELTHEME = LEVELTHEME
	Global.CAM_SCROLL = CAM_SCROLL
	Global.LEVELNUMBER = LEVELNUMBER
