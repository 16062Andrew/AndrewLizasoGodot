extends Area2D

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if counter == 2:
		Global.portal = true


func _on_body_entered(body: Node2D) -> void:
	counter += 1
	body.queue_free()
	print(counter)
