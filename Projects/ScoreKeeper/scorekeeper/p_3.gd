extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_pressed() -> void:
	Global.select = 9


func _on_j_1_pressed() -> void:
	Global.select = 10
	Global.something = true


func _on_j_2_pressed() -> void:
	Global.select = 11
	Global.something = true


func _on_j_3_pressed() -> void:
	Global.select = 12
	Global.something = true
