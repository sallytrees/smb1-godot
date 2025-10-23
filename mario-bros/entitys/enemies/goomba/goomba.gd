extends CharacterBody2D
var GRAVITY = 200
var DIR = 1
var SPEED = 5
var ALIVE = -77
signal bounce

func _physics_process(delta: float) -> void:
	if DIR == 1 and ALIVE == 1:
		position.x -= SPEED * delta
	elif DIR == -1 and ALIVE == 1:
		position.x += SPEED * delta
	if is_on_floor():
		position.y += GRAVITY * delta
	if ALIVE == 1:
		$Goomba.play("walk")
	
	move_and_slide()


func _on_left_body_entered(body: Node2D) -> void:
	DIR = -1


func _on_right_body_entered(body: Node2D) -> void:
	DIR = 1


func _on_death_body_entered(body: Node2D) -> void:
	$Goomba.play("death")
	if ALIVE == 1:
		if body.has_method("bounce"):
			body.bounce()
	ALIVE = 0
	$CollisionShape2D.scale.y = 0.5
	$Timer.start()

func _on_timer_timeout() -> void:
	queue_free()
