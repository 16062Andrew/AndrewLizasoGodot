extends Node2D

var Rpoint = 0
var Bpoint = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	Rpoint += 1


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	Bpoint += 1
