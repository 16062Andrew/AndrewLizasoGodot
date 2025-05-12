extends CharacterBody2D

@onready var Player = $"/root/Main/Player"

var direction : Vector2 = Vector2.ZERO
var speed = 25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Player.position.y > self.position.y:
		direction.y = 1
	elif Player.position.y < self.position.y:
		direction.y = -1
	if Player.position.x > self.position.x:
		direction.x = 1
	elif Player.position.x < self.position.x:
		direction.x = -1
	
	if self.direction.x > 10:
		self.direction.x = 10
	if self.direction.y > 10:
		self.direction.y = 10
	
	self.velocity += self.direction * speed
	
	move_and_slide()
