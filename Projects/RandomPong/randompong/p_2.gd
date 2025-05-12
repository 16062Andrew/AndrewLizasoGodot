extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed = 600

@onready var ball = $"../Ball"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_num >= 2:
		speed = 600
		if Input.get_action_strength("P2_up"):
			direction.y = -1
		elif Input.get_action_strength("P2_down"):
			direction.y = 1
		else:
			direction.y = 0
	else:
		speed = 500
		if ball.position.y > self.position.y:
			direction.y = 1
		else:
			direction.y = -1
	
	self.velocity = direction * speed
	
	move_and_slide()
