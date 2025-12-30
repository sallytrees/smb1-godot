extends Node
var VELOCITYY = 0
@export var NEXT_LEVEL = "res://levels/1-1/1_1.tscn"
var LEVEL_TIMER = 1
var PIPE = 0
var SIDE_PIPE = 0
var ISPLAYERGROUNDED = 0
var LEVELTHEME = 0
var CAM_SCROLL = 1
var CUTSCENE = 0
var ISPLAYERALIVE = 1
var COINS = 0.0
var LEVELNUMBER = "1-1"
var SCORE = 0
func _ready() -> void:
	$leveltimer.start()

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("down") and PIPE == 1 and ISPLAYERGROUNDED == 1:
		$warptimer.start()
		CUTSCENE = 1
	elif Input.is_action_pressed("left") and SIDE_PIPE == 1 or Input.is_action_pressed("right") and SIDE_PIPE == 1 and ISPLAYERGROUNDED  == 1:
		get_tree().change_scene_to_file(NEXT_LEVEL)
		$warptimer.start()
		CUTSCENE = 1
	LEVEL_TIMER = $leveltimer.time_left
	if ISPLAYERALIVE == 0:
		$DeathTimer.start()
	print(ISPLAYERALIVE)
	print($DeathTimer.time_left)


func _on_warptimer_timeout() -> void:
	get_tree().change_scene_to_file(NEXT_LEVEL)
	CUTSCENE = 0


func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()
