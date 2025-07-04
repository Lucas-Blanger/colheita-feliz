extends CharacterBody2D

var speed = 80

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = true
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = true
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("downwalk")
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("upwalk")
		input_vector.y -= 1
	else:
		$AnimatedSprite2D.play("idle")

	input_vector = input_vector.normalized()
	velocity = input_vector * speed
	move_and_slide()

func player_sell_method():
	pass
	
