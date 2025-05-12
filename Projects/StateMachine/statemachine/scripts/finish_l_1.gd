extends Area2D

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var mseconds: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.race:
		time += delta
		mseconds = fmod(time, 1) * 100
		seconds = fmod(time, 60)
		minutes = fmod(time, 3600) / 60

func _on_body_entered(body: Node2D) -> void:
	if Global.race:
		var temp_score = time
		Global.temp_score_text = "%02d:" % minutes + "%02d." % seconds + "%03d" % mseconds
		if temp_score < Global.save_data.high_score:
			Global.save_data.high_score_text = Global.temp_score_text
			Global.save_data.high_score = temp_score
			Global.save_data.save()
		get_tree().change_scene_to_file("res://scene/game_finished.tscn")
	else:
		get_tree().change_scene_to_file("res://scene/level_1_passed.tscn")
