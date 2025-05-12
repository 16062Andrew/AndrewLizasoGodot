extends Node

var portal = false
var counter = 0
var die = false
var level2_counter = 0
var level = [
	"res://level_1.tscn",
	"res://level_2.tscn",
	"res://level_3.tscn",
	"res://level_4.tscn",
	"res://level_5.tscn",
	"res://level_6.tscn",
	"res://end_screen.tscn"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file(level[counter])
		counter += 1
		portal = false
	if portal:
		get_tree().change_scene_to_file(level[counter])
		counter += 1
		portal = false
	if die:
		get_tree().change_scene_to_file(level[counter - 1])
		die = false
