extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_ceiling():
		velocity += -get_gravity() * delta
	else:
		if is_on_wall() && not self.velocity.y < 0:
			pass
		else:
			if not is_on_floor():
				velocity += get_gravity() * delta
	
	# Handle jump.
	if is_on_floor() || is_on_wall():
		if Input.is_action_just_pressed("up1"):
			velocity.y = JUMP_VELOCITY
	if is_on_ceiling() || is_on_wall():
		if Input.is_action_just_pressed("down1"):
			velocity.y = -JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left1", "right1")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
