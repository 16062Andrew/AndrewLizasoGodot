extends Area2D

@export var value = 3

@onready var player = $"/root/World/Player"
@onready var sprite = $AnimatedSprite2D
@onready var pickup_sound = $PickupSound

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	sprite.play("idle")

func _on_body_entered(body):
	if body.is_in_group("player"):
		player.add_ammo(value)
		sprite.play("collected")
		pickup_sound.play()
		sprite.animation_finished.connect(_on_animation_finished)

func _on_animation_finished():
	queue_free()

func _process(delta: float) -> void:
	pass
