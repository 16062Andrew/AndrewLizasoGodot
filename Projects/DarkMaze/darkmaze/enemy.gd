extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var yes = false
var no = false

@onready var player = $/root/Main/Player
@onready var hit = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var test = randi() % 4
	if test == 0:
		direction.y = 1
	elif test == 1:
		direction.y = -1
	elif test == 2:
		direction.x = 1
	else:
		direction.x = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if yes:
		if player.position.y < self.position.y:
			direction.y = -1
		elif player.position.y > self.position.y:
			direction.y = 1
		else:
			direction.y = 0
		
		if player.position.x < self.position.x:
			direction.x = -1
		elif player.position.x > self.position.x:
			direction.x = 1
		else:
			direction.x = 0
	
	if is_on_ceiling() || is_on_floor() || is_on_wall():
		print(Global.light)
		if yes && Global.player_touch:
			Global.hit = true
			hit.play()
			if Global.light > 0:
				Global.light -= .2
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
		else:
			if is_on_ceiling() || is_on_floor():
				direction.y = -(direction.y)
			if is_on_wall():
				direction.x = -(direction.x)
	
	Global.speed = 250 + (Global.potato_count * 10)
	
	self.velocity = direction * Global.speed
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.speed -= 100
		self.scale = self.scale * 2
		yes = true
	else:
		if direction.y == 1 || direction.y == -1:
			direction.y = -(direction.y)
		elif direction.x == 1 || direction.x == -1:
			direction.x = -(direction.x)
		no = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.speed += 100
		self.scale = self.scale / 2
		yes = false
		direction.y = 0
		direction.x = 0
		var test = randi() % 4
		print(test)
		if test == 0:
			direction.y = 1
		elif test == 1:
			direction.y = -1
		elif test == 2:
			direction.x = 1
		else:
			direction.x = -1
	elif no:
		if direction.y == 1 || direction.y == -1:
			direction.y = 0
			var test = randi() % 2
			if test == 0:
				direction.x = 1
			else:
				direction.x = -1
		elif direction.x == 1 || direction.x == -1:
			direction.x = 0
			var test = randi() % 2
			if test == 0:
				direction.y = 1
			else:
				direction.y = -1
		no = false
