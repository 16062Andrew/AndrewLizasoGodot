extends Control

@onready var bots = $VBoxContainer/Bots
@onready var speed = $VBoxContainer/Speed
@onready var xy = $VBoxContainer/xy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.bots_setting == 0:
		bots.text = "0 Bots"
	elif Global.bots_setting == 1:
		bots.text = "1 Bot on right side"
	else:
		bots.text = "2 Bots"
	if Global.speed_setting == 0:
		speed.text = "Speed: Normal"
	elif Global.speed_setting == 1:
		speed.text = "Speed: Fast"
	else:
		speed.text = "Speed: Random"
	if Global.xy_setting == 0:
		xy.text = "x Changes"
	elif Global.xy_setting == 1:
		xy.text = "y Changes"
	else:
		xy.text = "xy Changes"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.bots_setting == 0:
		bots.text = "0 Bots"


func _on_bots_pressed() -> void:
	if Global.bots_setting == 0:
		Global.bots_setting = 1
		bots.text = "1 Bot on right side"
	elif Global.bots_setting == 1:
		Global.bots_setting = 2
		bots.text = "2 Bots"
	else:
		Global.bots_setting = 0
		bots.text = "0 Bots"


func _on_speed_pressed() -> void:
	if Global.speed_setting == 0:
		Global.speed_setting = 1
		speed.text = "Speed: Fast"
	elif Global.speed_setting == 1:
		Global.speed_setting = 2
		speed.text = "Speed: Random"
	else:
		Global.speed_setting = 0
		speed.text = "Speed: Normal"


func _on_xy_pressed() -> void:
	if Global.xy_setting == 0:
		Global.xy_setting = 1
		xy.text = "y Changes"
	elif Global.xy_setting == 1:
		Global.xy_setting = 2
		xy.text = "xy Changes"
	elif Global.xy_setting == 2:
		Global.xy_setting = 3
		xy.text = "Control"
	else:
		Global.xy_setting = 0
		xy.text = "x Changes"


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://start.tscn")
