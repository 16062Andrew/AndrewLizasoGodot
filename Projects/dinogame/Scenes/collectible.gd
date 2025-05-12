extends Area2D

@export var value = 10

@onready var game = $"/root/World"
@onready var sprite = $AnimatedSprite2D

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	sprite.play("idle")

func _on_body_entered(body):
	if body.is_in_group("player"):
		game.add_score(value)
		sprite.play("collected")
		sprite.animation_finished.connect(_on_animation_finished)

func _on_animation_finished():
	queue_free()

func _process(delta: float) -> void:
	pass
