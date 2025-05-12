extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO
var start_direction = randi() % 2
var speedx = 300
var speedy = 300

@onready var player = $"../Player"
@onready var agent = $"../Agent"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if start_direction == 1:
		direction.x = 1
		Global.turn = true
	else:
		direction.x = -1
		Global.turn = false
	direction.y = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.ball_disabled:
		pass
	else:
		if is_on_ceiling() || is_on_floor():
			direction.y = -(direction.y)
			change_xy()
		if is_on_wall():
			direction.x = -(direction.x)
			if Global.turn:
				Global.turn = false
			else:
				Global.turn = true
			change_xy()
		self.velocity.x = self.direction.x * speedx
		self.velocity.y = self.direction.y * speedy
		if Global.xy_setting == 3:
			if Global.turn:
				if player.position.y < self.position.y:
						direction.y = -1
				elif player.position.y > self.position.y:
						direction.y = 1
			else:
				if agent.position.y < self.position.y:
						direction.y = -1
				elif agent.position.y > self.position.y:
						direction.y = 1
	
	move_and_slide()

func change_xy():
	if Global.xy_setting == 0:
		change_speed()
		speedx = Global.speed
	if Global.xy_setting == 1:
		change_speed()
		speedy = Global.speed
	if Global.xy_setting == 2:
		change_speed()
		speedx = Global.speed
		change_speed()
		speedy = Global.speed
	if Global.xy_setting == 3:
		Global.bots_setting = 0
		change_speed()
		speedx = Global.speed
		if Global.turn:
			if player.position.y < self.position.y:
					direction.y = -1
			elif player.position.y > self.position.y:
					direction.y = 1
		else:
			if agent.position.y < self.position.y:
					direction.y = -1
			elif agent.position.y > self.position.y:
					direction.y = 1

func change_speed():
	if Global.speed_setting == 0:
		Global.speed += 10
	elif Global.speed_setting == 1:
		Global.speed += 50
	else:
		Global.speed = randi() % 1000 + 100
