extends Node2D

@onready var TalkBox = $CanvasLayer/TalkBox
@onready var FinishLine = $FinishLine

var move_count = 0
var talkstuff = [
	"Oh you missed",
	"missed again",
	"you sure this is possible",
	"you can stop whenever you want",
	"no one is forcing you to do this",
	"you see that red X in the top right corner",
	"you don't wanna keep doing this",
	"I told you already it isnt possible",
	"fine I'll make more stuff"
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TalkBox.text = "theres the finish so go jump on it"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finish_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scene/level_3P2.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if move_count < talkstuff.size():
		move_count += 1
		FinishLine.position.x += 600
		TalkBox.text = talkstuff[move_count-1]
