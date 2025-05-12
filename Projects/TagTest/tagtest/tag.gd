extends Area2D

@onready var P1 = $"../P1"
@onready var P2 = $"../P2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.it == 1:
		self.position = P1.position
	else:
		self.position = P2.position


func _on_body_entered(body: Node2D) -> void:
	if Global.it == 1:
		if body != P1:
			Global.it = 2
	else:
		if body != P2:
			Global.it = 1
