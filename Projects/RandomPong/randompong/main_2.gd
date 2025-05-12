extends Node2D

@onready var leftscore = $Label
@onready var rightscore = $Label2
@onready var topscore = $Label3
@onready var bottumscore = $Label4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	leftscore.text = "P1:" + str(Global.leftnum)
	rightscore.text = "P2:" + str(Global.rightnum)
	bottumscore.text = "P4:" + str(Global.bottumnum)
	topscore.text = "P3:" + str(Global.topnum)
	if Global.rightnum == 7 || Global.leftnum == 7 || Global.bottumnum == 7 || Global.topnum == 7:
		get_tree().change_scene_to_file("res://end_screen.tscn")


func _on_left_body_entered(body: Node2D) -> void:
	body.position = Vector2(586,341)
	Global.rightnum += 1


func _on_right_body_entered(body: Node2D) -> void:
	body.position = Vector2(586,341)
	Global.leftnum += 1


func _on_roof_body_entered(body: Node2D) -> void:
	body.position = Vector2(586,341)
	Global.bottumnum += 1


func _on_floor_body_entered(body: Node2D) -> void:
	body.position = Vector2(586,341)
	Global.topnum += 1
