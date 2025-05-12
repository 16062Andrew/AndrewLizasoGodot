extends Control

@onready var win = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.leftnum == 7:
		win.text = "P1 WINS"
	elif Global.rightnum == 7:
		win.text = "P2 WINS"
	elif Global.topnum == 7:
		win.text = "P3 WINS"
	elif Global.bottumnum == 7:
		win.text = "P4 WINS"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_action_strength("ui_accept"):
		get_tree().change_scene_to_file("res://transition.tscn")
		Global.rightnum = 0
		Global.leftnum = 0
		Global.topnum = 0
		Global.bottumnum = 0


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://transition.tscn")
	Global.rightnum = 0
	Global.leftnum = 0
