extends CharacterBody2D

signal player_died

@export var gravity = 1600
@export var jump_power = 600

@onready var sprite = $AnimatedSprite2D
@onready var JumpSound = $JumpSound
@onready var camera = $"../Camera2D"
@onready var death_sound = $DeathSound
@onready var collicion_shape = $CollisionShape2D
@onready var game = $"/root/World/"
@onready var shoot_sound = $ShootSound
@onready var projectile_position = $ProjectilePosition

var projectile = preload("res://Scenes/projectile.tscn")
var active = true
var jumps_remaining = 2
var was_jumping = false
var jump_pitch = 1.0
var ammo = 3

func _ready() -> void:
	print("hello world")
	sprite.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if active:
		
		camera.position = position
		
		if was_jumping and is_on_floor():
			was_jumping = false
			jumps_remaining = 2
			sprite.play("run")
			jump_pitch = 1.0 
			print("reset")
		
		if Input.is_action_just_pressed("jump") and jumps_remaining > 0:
			jumps_remaining -= 1
			was_jumping = true
			velocity.y = -jump_power
			print("jump")
			
			if jumps_remaining == 1:
				sprite.play("jump")
				print("1")
			else:
				sprite.play("double_jump")
				print("2")
			
			JumpSound.set_pitch_scale(jump_pitch)
			JumpSound.play()
			jump_pitch += 0.2
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire") and ammo > 0:
		var projectile_instace = projectile.instantiate()
		projectile_instace.position = projectile_position.global_position
		game.add_child(projectile_instace)
		shoot_sound.play()
		sprite.play("shoot")
		ammo -= 1

func die():
	death_sound.play()
	sprite.play("death")
	active = false
	collicion_shape.set_deferred("disabled", true)
	emit_signal("player_died")

func _on_animation_finished():
	if sprite.animation == "shoot":
		sprite.play("run")

func add_ammo(amount):
	ammo += amount
