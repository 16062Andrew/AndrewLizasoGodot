extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed = 400
var energy = 100
var energy_reload = 500

@onready var sprite = $Sprite2D
@onready var light = $PointLight2D
@onready var label = $CanvasLayer/Label
@onready var tatos = $CanvasLayer/Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	light.position.x = Global.light + 10
	label.text = "Potato Count: " + str(Global.potato_count) + " - Energy = " + str(energy)
	if Global.potato_count == 12:
		tatos.visible = true
		Global.twelve = true
	
	if Global.light <= 0:
		get_tree().change_scene_to_file("res://death.tscn")
	
	if is_on_ceiling() || is_on_floor() || is_on_wall():
		Global.player_touch = true
	else:
		Global.player_touch = false
	
	if Global.hit:
		sprite.play("hit")
	
	if Global.potato:
		sprite.play("moveing")
	
	if Input.get_action_strength("shift") && energy > 0:
		speed = 800
		energy_reload -= 5
	else:
		speed = 400
	energy = energy_reload / 5
	if self.velocity.x == 0 && self.velocity.y == 0 && energy < 100:
		energy_reload += 1
	
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
	
	self.velocity = direction * speed
	
	move_and_slide()


func _on_sprite_2d_animation_finished() -> void:
	Global.hit = false
	Global.potato = false
	sprite.play("default")
