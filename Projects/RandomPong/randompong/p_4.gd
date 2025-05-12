extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed = 600

@onready var ball = $"../Ball"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_num == 4:
		speed = 600
		if Input.get_action_strength("P4_left"):
			direction.x = -1
		elif Input.get_action_strength("P4_right"):
			direction.x = 1
		else:
			direction.x = 0
	else:
		speed = 500
		if ball.position.x > self.position.x:
			direction.x = 1
		else:
			direction.x = -1
	
	self.velocity = direction * speed
	
	move_and_slide()
