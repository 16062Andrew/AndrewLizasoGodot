extends Sprite2D

var active = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && active:
		Global.potato = true
		Global.light += .5
		if Global.light > 4:
			Global.light = 4
		self.visible = false
		active = false
		Global.potato_count += 1
