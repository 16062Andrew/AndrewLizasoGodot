extends CharacterBody2D

const SPEED = 300
var direction : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_action_strength("up"):
		direction.y = -1
	elif Input.get_action_strength("down"):
		direction.y = 1
	else:
		direction.y = 0
	if Input.get_action_strength("left"):
		direction.x = -1
	elif Input.get_action_strength("right"):
		direction.x = 1
	else:
		direction.x = 0
	self.velocity = self.direction * SPEED
	
	if is_on_ceiling() || is_on_floor() || is_on_wall():
		print("hit" + str(Global.hit))
		Global.hit += 1
	
	move_and_slide()
