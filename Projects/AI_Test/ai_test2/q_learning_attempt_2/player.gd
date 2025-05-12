extends CharacterBody2D

const SPEED = 600.0
var direction : Vector2 = Vector2.ZERO

@onready var Ball = $"../Ball"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.bots_setting == 2:
		if not Global.turn:
			if Ball.position.y < self.position.y:
				move_up()
			elif Ball.position.y > self.position.y:
				move_down()
		else:
			direction.y = 0
	else:
		if Input.get_action_strength("up"):
			move_up()
		elif Input.get_action_strength("down"):
			move_down()
		else:
			direction.y = 0
	
	self.velocity = self.direction * SPEED
	
	move_and_slide()

func move_up():
	direction.y = -1

func move_down():
	direction.y = 1
