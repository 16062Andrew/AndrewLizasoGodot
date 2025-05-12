extends Control

@onready var Score = $HBoxContainer/Score
@onready var DelComp1 = $HBoxContainer/Score/Competitor1
@onready var DelComp2 = $HBoxContainer/Score/Competitor2
@onready var DelComp3 = $HBoxContainer/Score/Competitor3
@onready var DelComp4 = $HBoxContainer/Score/Competitor4
@onready var DelComp5 = $HBoxContainer/Score/Competitor5
@onready var DelComp6 = $HBoxContainer/Score/Competitor6
@onready var DelComp7 = $HBoxContainer/Score/Competitor7
@onready var DelComp8 = $HBoxContainer/Score/Competitor8
@onready var DelComp9 = $HBoxContainer/Score/Competitor9
@onready var DelComp10 = $HBoxContainer/Score/Competitor10
@onready var DelComp11 = $HBoxContainer/Score/Competitor11
@onready var DelComp12 = $HBoxContainer/Score/Competitor12
@onready var DelComp13 = $HBoxContainer/Score/Competitor13
@onready var DelComp14 = $HBoxContainer/Score/Competitor14
@onready var DelComp15 = $HBoxContainer/Score/Competitor15
@onready var DelComp16 = $HBoxContainer/Score/Competitor16


var Competitior = preload("res://competitor.tscn")

var CompNum = 0
var DelCompNum = [
	DelComp1,
	DelComp2,
	DelComp3,
	DelComp4,
	DelComp5,
	DelComp6,
	DelComp7,
	DelComp8,
	DelComp9,
	DelComp10,
	DelComp11,
	DelComp12,
	DelComp13,
	DelComp14,
	DelComp15,
	DelComp16
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_competitor_pressed() -> void:
	var CompPerson = Competitior.instantiate()
	Score.add_child(CompPerson)
	CompNum += 1
	print(CompNum)
	print(DelCompNum[0])


func _on_remove_competitor_pressed() -> void:
	DelCompNum[CompNum].queue_free()
