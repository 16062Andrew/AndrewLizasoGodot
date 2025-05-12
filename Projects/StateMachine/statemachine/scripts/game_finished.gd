extends Control

@onready var YourTime = $YourTime
@onready var BestTime = $BestTime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.race:
		YourTime.text = Global.temp_score_text
		BestTime.text = Global.save_data.high_score_text
	else:
		YourTime.visible = false
		BestTime.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/start_screen.tscn")
