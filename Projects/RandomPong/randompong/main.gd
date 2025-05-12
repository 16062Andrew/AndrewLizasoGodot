extends Node2D

@onready var leftscore = $Label
@onready var rightscore = $Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	leftscore.text = str(Global.leftnum)
	rightscore.text = str(Global.rightnum)
	if Global.rightnum == 7 || Global.leftnum == 7:
		get_tree().change_scene_to_file("res://end_screen.tscn")


func _on_left_body_entered(body: Node2D) -> void:
	body.position = Vector2(586,341)
	Global.rightnum += 1


func _on_right_body_entered(body: Node2D) -> void:
	body.position = Vector2(586,341)
	Global.leftnum += 1
