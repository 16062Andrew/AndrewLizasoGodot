extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


func _on_HUD_start_game():
	var dialog = Dialogic.start("ConversationWithSanta")
	add_child(dialog)
