extends Node


var temp_score_text
var save_data:SaveData
var race = false
var mobile = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	save_data = SaveData.load_or_create()
