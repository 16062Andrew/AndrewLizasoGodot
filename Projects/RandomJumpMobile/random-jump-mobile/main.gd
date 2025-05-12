extends Node2D

var enemy = preload("res://enemy.tscn")
var i = 2

@onready var thing = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy_pos = enemy.instantiate()
	enemy_pos.position = Vector2(1027, 277)
	self.add_child(enemy_pos)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.level < i:
		thing.position.x = 1000
	if Global.level > i:
		thing.position.x = 0
	
	if Global.hit >= 20:
		Global.level -= 1
		Global.hit = 0
		get_tree().change_scene_to_file("res://main.tscn")




func _on_area_2d_body_exited(body: Node2D) -> void:
	var enemy_pos = enemy.instantiate()
	enemy_pos.position = Vector2(1027, 277)
	self.add_child(enemy_pos)
	i += 1
