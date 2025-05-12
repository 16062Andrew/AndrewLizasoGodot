extends Control

@onready var Players = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_action_strength("ui_accept"):
		if Global.player_num <= 2:
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			get_tree().change_scene_to_file("res://main_2.tscn")
	
	Players.text = "Player amount: " + str(Global.player_num)


func _on_button_2_pressed() -> void:
	if Global.player_num <= 2:
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		get_tree().change_scene_to_file("res://main_2.tscn")


func _on_button_pressed() -> void:
	if Global.player_num == 1:
		Global.player_num = 2
	elif Global.player_num == 2:
		Global.player_num = 3
	elif Global.player_num == 3:
		Global.player_num = 4
	elif Global.player_num == 4:
		Global.player_num = 1
