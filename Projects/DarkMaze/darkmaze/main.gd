extends Node2D

@onready var light = $PointLight2D
@onready var background = $Background
@onready var start = $start


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !background.playing:
		background.playing = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && Global.potato_count == 12:
		get_tree().change_scene_to_file("res://win.tscn")
