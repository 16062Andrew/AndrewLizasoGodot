extends Node2D

var right_score = 0
var left_score = 0
var level = 1


@onready var Left = $LeftLabel
@onready var Right = $RightLabel
@onready var ball = $Ball
@onready var Level = $Level
@onready var player = $Player
@onready var agent = $Agent
@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.speed = 300
	Global.ball_disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level = int((Global.speed / 100) - 2)
	Level.text = "Speed Level: %s" % level
	if Input.get_action_strength("ESC"):
		get_tree().change_scene_to_file("res://start.tscn")
	
	if left_score == 7:
		get_tree().change_scene_to_file("res://start.tscn")
	
	if right_score == 7:
		get_tree().change_scene_to_file("res://start.tscn")

func _on_left_body_entered(body: Node2D) -> void:
	ball.position = Vector2(586,332)
	player.position = Vector2(42,317)
	agent.position = Vector2(1110,317)
	Global.speed = 300
	right_score += 1
	Right.text = str(right_score)


func _on_right_body_entered(body: Node2D) -> void:
	ball.position = Vector2(586,332)
	player.position = Vector2(42,317)
	agent.position = Vector2(1110,317)
	Global.speed = 300
	left_score += 1
	Left.text = str(left_score)


func _on_button_pressed() -> void:
	Global.ball_disabled = false
	button.disabled = true
	button.visible = false
