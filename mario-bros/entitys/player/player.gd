extends CharacterBody2D

var GRAVITY = 500
var VELOCITYY = 0
var VELOCITYX: int = 0 
var JUMP = -245
var JUMPCAP = -1000
var SPEED = 198
var SPEEDCAP  = 70
var FRICTION = 90
signal ACTIVATE
func _physics_process(delta: float) -> void:
	print(VELOCITYY)
	animation()
	self.position.y += VELOCITYY * delta
	self.position.x += VELOCITYX * delta
	if is_on_floor() == false:
		VELOCITYY += GRAVITY * delta
	if VELOCITYY > 0 and is_on_floor():
		VELOCITYY = 0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		VELOCITYY = JUMP
	elif Input.is_action_just_released("jump") and is_on_floor() == false:
		VELOCITYY = VELOCITYY / 2
	if Input.is_action_pressed("left"):
		if VELOCITYX > -SPEEDCAP:
			VELOCITYX -= SPEED * delta
		$AnimatedSprite2D.flip_h = true
	if VELOCITYX < 0:
		VELOCITYX += FRICTION * delta
	if Input.is_action_pressed("right"):
		if VELOCITYX < SPEEDCAP:
			VELOCITYX += SPEED * delta
		$AnimatedSprite2D.flip_h = false
	if VELOCITYX > 0:
		VELOCITYX -= FRICTION * delta
	if VELOCITYY < JUMPCAP:
		VELOCITYY = JUMPCAP
	move_and_slide()

func animation():
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("walk")
	else: $AnimatedSprite2D.play("stand")
	if is_on_floor() == false:
		$AnimatedSprite2D.play("jump")


func bounce():
	VELOCITYY = JUMP / 2


func _on_bounce_body_entered(body: Node2D) -> void:
	bounce()
