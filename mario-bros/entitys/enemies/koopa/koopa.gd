extends CharacterBody2D
var GRAVITY = 30 * 2 
var DIR = 1
var SPEED = 25
var ALIVE = -77
var SHELL = 0
signal bounce
signal hurt

func _physics_process(delta: float) -> void:
	if DIR == 1 and ALIVE == 1:
		position.x -= SPEED * delta
	elif DIR == -1 and ALIVE == 1:
		position.x += SPEED * delta
	if is_on_floor() == false:
		position.y += GRAVITY * delta
	if ALIVE == 1:
		$koopa.play("walk")
	if DIR == 1 and ALIVE == -1:
		position.x -= SPEED * 2 * delta
	elif DIR == -1 and ALIVE == -1:
		position.x += SPEED * 2 * delta
		$koopa.play("shell")
	if $Timer.time_left < 3 and ALIVE == 0:
		$koopa.play("getup")
	if $RayCast2D.is_colliding() == true and ALIVE > -2:
		DIR = -1
		$koopa.flip_h = true
	if $RayCast2D2.is_colliding() == true and ALIVE > -2:
		DIR = 1
		$koopa.flip_h = false
	move_and_slide()
	print(ALIVE)


func _on_left_body_entered(body: Node2D) -> void:
	DIR = -1
	$koopa.flip_h = true

func _on_right_body_entered(body: Node2D) -> void:
	DIR = 1
	$koopa.flip_h = false


func _on_death_body_entered(body: Node2D) -> void:
	$koopa.play("shell")
	ALIVE -= 1
	if body.has_method("bounce"):
		body.bounce()
	$CollisionShape2D.scale.y = 0.5
	$Timer.start()
	if ALIVE < -1:
		ALIVE = 0
	if ALIVE == -1:
		SPEED = 60
	else: SPEED = 25
	if DIR == -1:
		DIR = 1
	if DIR == 1:
		DIR = -1
func _on_timer_timeout() -> void:
	if ALIVE == 0:
		ALIVE = 1
		$CollisionShape2D.scale.y = 1.0


func _on_hit_body_entered(body: Node2D) -> void:
	if body.has_method("shell_death") and ALIVE == -1:
		body.shell_death()

func shell_death():
	ALIVE = -2
	$koopa.flip_v = true
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	$death2.start()

func activate():
	if ALIVE == -77:
		ALIVE = 1

func deactivate():
	if ALIVE == 1:
		ALIVE = -77
func _on_death_2_timeout() -> void:
	queue_free()
