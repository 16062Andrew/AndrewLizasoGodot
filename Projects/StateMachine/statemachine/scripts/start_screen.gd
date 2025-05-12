extends Control

var test = true

@onready var race_button = $Button3
@onready var Mobile_Button = $Button4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	race_button.text = "Race Mode: " + str(Global.race)
	Mobile_Button.text = "Mobile: " + str(Global.mobile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/level_select.tscn")


func _on_button_3_pressed() -> void:
	if test:
		Global.race = true
		test = false
		race_button.text = "Race_Mode: True"
	else:
		Global.race = false
		test = true
		race_button.text = "Race_Mode: False"
		Global.mobile = false
		test = true
		Mobile_Button.text = "Mobile: False"


func _on_button_4_pressed() -> void:
	if test:
		Global.mobile = true
		test = false
		Mobile_Button.text = "Mobile: True"
		Global.race = true
		test = false
		race_button.text = "Race_Mode: True"
	else:
		Global.mobile = false
		test = true
		Mobile_Button.text = "Mobile: False"
		Global.race = false
		test = true
		race_button.text = "Race_Mode: False"
