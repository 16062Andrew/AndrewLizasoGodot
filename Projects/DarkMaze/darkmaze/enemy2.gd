extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speedx = 300
var speedy = 300
var yes = false
@onready var player = $"../Player"
@onready var hit = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit.play
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
	Global.bounce_speed = 100 + (Global.potato_count * 10)
	
	if is_on_ceiling() || is_on_floor():
		direction.y = -(direction.y)
		speedx = randi() % 1000 + Global.bounce_speed
		speedy = randi() % 1000 + Global.bounce_speed
		if yes:
			if player.position.x > self.position.x:
				direction.x = 1
			else:
				direction.x = -1
		else:
			var directy = randi() % 2
			if directy == 0:
				direction.x = 1
			else:
				direction.x = -1
				
	
	if is_on_wall():
		direction.x = -(direction.x)
		speedx = randi() % 1000 + Global.bounce_speed
		speedy = randi() % 1000 + Global.bounce_speed
		if yes:
			if player.position.y > self.position.y:
				direction.y = 1
			else:
				direction.y = -1
		else:
			var directy = randi() % 2
			if directy == 0:
				direction.y = 1
			else:
				direction.y = -1
	
	if is_on_ceiling() || is_on_floor() || is_on_wall():
		if yes && Global.player_touch:
			print("AHHHHHHHHHHHHHHHH")
			Global.hit = true
			hit.play()
			if Global.light > 0:
				Global.light -= .5
			else:
				Global.light = 0
			if direction.x == 1:
				player.position.x += 25
			if direction.x == -1:
				player.position.x -= 25
			if direction.y == -1:
				player.position.y -= 25
			if direction.y == 1:
				player.position.y += 25
	
	self.velocity.x = direction.x * speedx
	self.velocity.y = direction.y * speedy
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		yes = true
		print("AHHHHHHHHHHHHHHHH")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		yes = false
