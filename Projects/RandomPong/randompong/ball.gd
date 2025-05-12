extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speedx = 300
var speedy = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start = randi() % 4
	if start == 0:
		direction.x = 1
		direction.y = 1
	elif start == 1:
		direction.x = -1
		direction.y = 1
	elif start == 2:
		direction.x = 1
		direction.y = -1
	else:
		direction.x = -1
		direction.y = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_on_ceiling() || is_on_floor():
		direction.y = -(direction.y)
		speedx = randi() % 1000 + 100
		speedy = randi() % 1000 + 100
		var directx = randi() % 2
		if directx == 0:
			direction.x = 1
		else:
			direction.x = -1
	
	if is_on_wall():
		direction.x = -(direction.x)
		speedx = randi() % 1000 + 100
		speedy = randi() % 1000 + 100
		var directy = randi() % 2
		if directy == 0:
			direction.y = 1
		else:
			direction.y = -1
	
	
	self.velocity.x = direction.x * speedx
	self.velocity.y = direction.y * speedy
	
	move_and_slide()
