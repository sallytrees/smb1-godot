extends CharacterBody2D

var GRAVITY = 500
var VELOCITYY = 0
var VELOCITYX: int = 0 
var JUMP = -245
var JUMPCAP = -1000
var SPEED = 198
var SPEEDCAP  = 70
var FRICTION = 90
var HEALTH = 1
signal ACTIVATE
func _physics_process(delta: float) -> void:
	print(VELOCITYY)
	animation(delta)
	self.position.y += VELOCITYY * delta
	self.position.x += VELOCITYX * delta
	if is_on_floor() == false:
		VELOCITYY += GRAVITY * delta
	if VELOCITYY > 0 and is_on_floor():
		VELOCITYY = 0
	if Input.is_action_just_pressed("jump") and is_on_floor() and HEALTH == 1:
		VELOCITYY = JUMP
	elif Input.is_action_just_released("jump") and is_on_floor() == false and HEALTH == 1:
		VELOCITYY = VELOCITYY / 2
	if Input.is_action_pressed("left") and HEALTH == 1:
		if VELOCITYX > -SPEEDCAP:
			VELOCITYX -= SPEED * delta
		$AnimatedSprite2D.flip_h = true
	if VELOCITYX < 0:
		VELOCITYX += FRICTION * delta
	if Input.is_action_pressed("right") and HEALTH == 1:
		if VELOCITYX < SPEEDCAP:
			VELOCITYX += SPEED * delta
		$AnimatedSprite2D.flip_h = false
	if VELOCITYX > 0:
		VELOCITYX -= FRICTION * delta
	if VELOCITYY < JUMPCAP:
		VELOCITYY = JUMPCAP
	move_and_slide()

func animation(delta):
	if Input.is_action_pressed("left") and HEALTH == 1:
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("right") and HEALTH == 1:
		$AnimatedSprite2D.play("walk")
	elif HEALTH == 1:
		$AnimatedSprite2D.play("stand")
	if is_on_floor() == false and HEALTH == 1:
		$AnimatedSprite2D.play("jump")
	if  HEALTH == 0:
		$AnimatedSprite2D.play("death")
	if HEALTH < 1:
		death(delta)


func bounce():
	VELOCITYY = JUMP / 2

func negativebounce():
	VELOCITYY = -JUMP / 6

func _on_bounce_body_entered(body: Node2D) -> void:
	bounce()

func death(delta):
	VELOCITYX = 0
	$CollisionShape2D.disabled = true

func damage():
	HEALTH -= 1
	if HEALTH < 1:
		VELOCITYX = 0
		VELOCITYY = JUMP

func _on_blockbreak_body_entered(body: Node2D) -> void:
	if body.has_method("destroy"):
		if VELOCITYY < -90:
			body.destroy()
			negativebounce()
