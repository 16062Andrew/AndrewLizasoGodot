extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up2") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.get_action_strength("down2"):
		set_collision_layer_value(1,false)
		set_collision_mask_value(1,false)
	else:
		set_collision_layer_value(1,true)
		set_collision_mask_value(1,true)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left2", "right2")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
