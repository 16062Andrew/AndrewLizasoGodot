extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(_on_body_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body):
	print("body entered")
	if body.is_in_group("enemy"):
		print("enemy")
		body.set_active(true)


func _on_body_exited(body):
	if body.is_in_group("enemy"):
		print("body exited")
		body.queue_free()
