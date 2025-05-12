extends Node2D

var right = false
var wrong = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wrong:
		$Lava.position.x -= 1
	if right:
		$Lava.position.x += 5


func _on_button_body_entered(body: Node2D) -> void:
	wrong = true
	Global.level2_counter += 1


func _on_button_2_body_entered(body: Node2D) -> void:
	wrong = true
	Global.level2_counter += 1


func _on_button_3_body_entered(body: Node2D) -> void:
	wrong = true
	Global.level2_counter += 1


func _on_button_4_body_entered(body: Node2D) -> void:
	if Global.level2_counter >= 3:
		right = true
	else:
		wrong = true
		Global.level2_counter += 1


func _on_button_5_body_entered(body: Node2D) -> void:
	wrong = true
	Global.level2_counter += 1


func _on_button_6_body_entered(body: Node2D) -> void:
	wrong = true
	Global.level2_counter += 1


func _on_button_7_body_entered(body: Node2D) -> void:
	wrong = true
	Global.level2_counter += 1


func _on_button_8_body_entered(body: Node2D) -> void:
	wrong = true
	Global.level2_counter += 1
