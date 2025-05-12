extends Control

@onready var P1 = $HBoxContainer/VBoxContainer2/P1/Player
@onready var P1J1 = $HBoxContainer/VBoxContainer2/P1/J1
@onready var P1J2 = $HBoxContainer/VBoxContainer2/P1/J2
@onready var P1J3 = $HBoxContainer/VBoxContainer2/P1/J3
@onready var P1T = $HBoxContainer/VBoxContainer2/P1/Total
@onready var P2 = $HBoxContainer/VBoxContainer2/P2/Player
@onready var P2J1 = $HBoxContainer/VBoxContainer2/P2/J1
@onready var P2J2 = $HBoxContainer/VBoxContainer2/P2/J2
@onready var P2J3 = $HBoxContainer/VBoxContainer2/P2/J3
@onready var P2T = $HBoxContainer/VBoxContainer2/P2/Total
@onready var P3 = $HBoxContainer/VBoxContainer2/P3/Player
@onready var P3J1 = $HBoxContainer/VBoxContainer2/P3/J1
@onready var P3J2 = $HBoxContainer/VBoxContainer2/P3/J2
@onready var P3J3 = $HBoxContainer/VBoxContainer2/P3/J3
@onready var P3T = $HBoxContainer/VBoxContainer2/P3/Total
@onready var P4 = $HBoxContainer/VBoxContainer2/P4/Player
@onready var P4J1 = $HBoxContainer/VBoxContainer2/P4/J1
@onready var P4J2 = $HBoxContainer/VBoxContainer2/P4/J2
@onready var P4J3 = $HBoxContainer/VBoxContainer2/P4/J3
@onready var P4T = $HBoxContainer/VBoxContainer2/P4/Total
@onready var P5 = $HBoxContainer/VBoxContainer2/P5/Player
@onready var P5J1 = $HBoxContainer/VBoxContainer2/P5/J1
@onready var P5J2 = $HBoxContainer/VBoxContainer2/P5/J2
@onready var P5J3 = $HBoxContainer/VBoxContainer2/P5/J3
@onready var P5T = $HBoxContainer/VBoxContainer2/P5/Total
@onready var P6 = $HBoxContainer/VBoxContainer2/P6/Player
@onready var P6J1 = $HBoxContainer/VBoxContainer2/P6/J1
@onready var P6J2 = $HBoxContainer/VBoxContainer2/P6/J2
@onready var P6J3 = $HBoxContainer/VBoxContainer2/P6/J3
@onready var P6T = $HBoxContainer/VBoxContainer2/P6/Total
@onready var P7 = $HBoxContainer/VBoxContainer2/P7/Player
@onready var P7J1 = $HBoxContainer/VBoxContainer2/P7/J1
@onready var P7J2 = $HBoxContainer/VBoxContainer2/P7/J2
@onready var P7J3 = $HBoxContainer/VBoxContainer2/P7/J3
@onready var P7T = $HBoxContainer/VBoxContainer2/P7/Total
@onready var P8 = $HBoxContainer/VBoxContainer2/P8/Player
@onready var P8J1 = $HBoxContainer/VBoxContainer2/P8/J1
@onready var P8J2 = $HBoxContainer/VBoxContainer2/P8/J2
@onready var P8J3 = $HBoxContainer/VBoxContainer2/P8/J3
@onready var P8T = $HBoxContainer/VBoxContainer2/P8/Total
@onready var P9 = $HBoxContainer/VBoxContainer2/P9/Player
@onready var P9J1 = $HBoxContainer/VBoxContainer2/P9/J1
@onready var P9J2 = $HBoxContainer/VBoxContainer2/P9/J2
@onready var P9J3 = $HBoxContainer/VBoxContainer2/P9/J3
@onready var P9T = $HBoxContainer/VBoxContainer2/P9/Total
@onready var P10 = $HBoxContainer/VBoxContainer2/P10/Player
@onready var P10J1 = $HBoxContainer/VBoxContainer2/P10/J1
@onready var P10J2 = $HBoxContainer/VBoxContainer2/P10/J2
@onready var P10J3 = $HBoxContainer/VBoxContainer2/P10/J3
@onready var P10T = $HBoxContainer/VBoxContainer2/P10/Total
@onready var P11 = $HBoxContainer/VBoxContainer2/P11/Player
@onready var P11J1 = $HBoxContainer/VBoxContainer2/P11/J1
@onready var P11J2 = $HBoxContainer/VBoxContainer2/P11/J2
@onready var P11J3 = $HBoxContainer/VBoxContainer2/P11/J3
@onready var P11T = $HBoxContainer/VBoxContainer2/P11/Total
@onready var P12 = $HBoxContainer/VBoxContainer2/P12/Player
@onready var P12J1 = $HBoxContainer/VBoxContainer2/P12/J1
@onready var P12J2 = $HBoxContainer/VBoxContainer2/P12/J2
@onready var P12J3 = $HBoxContainer/VBoxContainer2/P12/J3
@onready var P12T = $HBoxContainer/VBoxContainer2/P12/Total

var num = 0
var tracker = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	P1J1.text = str(Global.P1J1)
	P1J2.text = str(Global.P1J2)
	P1J3.text = str(Global.P1J3)
	P1T.text = str(Global.P1J1 + Global.P1J2 + Global.P1J3)
	P2J1.text = str(Global.P2J1)
	P2J2.text = str(Global.P2J2)
	P2J3.text = str(Global.P2J3)
	P2T.text = str(Global.P2J1 + Global.P2J2 + Global.P2J3)
	P3J1.text = str(Global.P3J1)
	P3J2.text = str(Global.P3J2)
	P3J3.text = str(Global.P3J3)
	P3T.text = str(Global.P3J1 + Global.P3J2 + Global.P3J3)
	P4J1.text = str(Global.P4J1)
	P4J2.text = str(Global.P4J2)
	P4J3.text = str(Global.P4J3)
	P4T.text = str(Global.P4J1 + Global.P4J2 + Global.P4J3)
	P5J1.text = str(Global.P5J1)
	P5J2.text = str(Global.P5J2)
	P5J3.text = str(Global.P5J3)
	P5T.text = str(Global.P5J1 + Global.P5J2 + Global.P5J3)
	P6J1.text = str(Global.P6J1)
	P6J2.text = str(Global.P6J2)
	P6J3.text = str(Global.P6J3)
	P6T.text = str(Global.P6J1 + Global.P6J2 + Global.P6J3)
	P7J1.text = str(Global.P7J1)
	P7J2.text = str(Global.P7J2)
	P7J3.text = str(Global.P7J3)
	P7T.text = str(Global.P7J1 + Global.P7J2 + Global.P7J3)
	P8J1.text = str(Global.P8J1)
	P8J2.text = str(Global.P8J2)
	P8J3.text = str(Global.P8J3)
	P8T.text = str(Global.P8J1 + Global.P8J2 + Global.P8J3)
	P9J1.text = str(Global.P9J1)
	P9J2.text = str(Global.P9J2)
	P9J3.text = str(Global.P9J3)
	P9T.text = str(Global.P9J1 + Global.P9J2 + Global.P9J3)
	P10J1.text = str(Global.P10J1)
	P10J2.text = str(Global.P10J2)
	P10J3.text = str(Global.P10J3)
	P10T.text = str(Global.P10J1 + Global.P10J2 + Global.P10J3)
	P11J1.text = str(Global.P11J1)
	P11J2.text = str(Global.P11J2)
	P11J3.text = str(Global.P11J3)
	P11T.text = str(Global.P11J1 + Global.P11J2 + Global.P11J3)
	P12J1.text = str(Global.P12J1)
	P12J2.text = str(Global.P12J2)
	P12J3.text = str(Global.P12J3)
	P12T.text = str(Global.P12J1 + Global.P12J2 + Global.P12J3)





func _on_1_pressed() -> void:
	num = 1
	call("number")
	if Global.something:
		Global.select += 1


func _on_2_pressed() -> void:
	num = 2
	call("number")
	if Global.something:
		Global.select += 1


func _on_3_pressed() -> void:
	num = 3
	call("number")
	if Global.something:
		Global.select += 1


func _on_4_pressed() -> void:
	num = 4
	call("number")
	if Global.something:
		Global.select += 1


func _on_5_pressed() -> void:
	num = 5
	call("number")
	if Global.something:
		Global.select += 1


func _on_6_pressed() -> void:
	num = 6
	call("number")
	if Global.something:
		Global.select += 1


func _on_7_pressed() -> void:
	num = 7
	call("number")
	if Global.something:
		Global.select += 1


func _on_8_pressed() -> void:
	num = 8
	call("number")
	if Global.something:
		Global.select += 1


func _on_9_pressed() -> void:
	num = 9
	call("number")
	if Global.something:
		Global.select += 1


func _on__pressed() -> void:
	num = 0
	call("number")
	if Global.something:
		Global.select += 1

func number():
	if Global.select == 2:
		Global.P1J1 = num
	elif Global.select == 3:
		Global.P1J2 = num
	elif Global.select == 4:
		Global.P1J3 = num
	elif Global.select == 6:
		Global.P2J1 = num
	elif Global.select == 7:
		Global.P2J2 = num
	elif Global.select == 8:
		Global.P2J3 = num
	elif Global.select == 10:
		Global.P3J1 = num
	elif Global.select == 11:
		Global.P3J2 = num
	elif Global.select == 12:
		Global.P3J3 = num
	elif Global.select == 14:
		Global.P4J1 = num
	elif Global.select == 15:
		Global.P4J2 = num
	elif Global.select == 16:
		Global.P4J3 = num
	elif Global.select == 18:
		Global.P5J1 = num
	elif Global.select == 19:
		Global.P5J2 = num
	elif Global.select == 20:
		Global.P5J3 = num
	elif Global.select == 22:
		Global.P6J1 = num
	elif Global.select == 23:
		Global.P6J2 = num
	elif Global.select == 24:
		Global.P6J3 = num
	elif Global.select == 26:
		Global.P7J1 = num
	elif Global.select == 27:
		Global.P7J2 = num
	elif Global.select == 28:
		Global.P7J3 = num
	elif Global.select == 30:
		Global.P8J1 = num
	elif Global.select == 31:
		Global.P8J2 = num
	elif Global.select == 32:
		Global.P8J3 = num
	elif Global.select == 34:
		Global.P9J1 = num
	elif Global.select == 35:
		Global.P9J2 = num
	elif Global.select == 36:
		Global.P9J3 = num
	elif Global.select == 38:
		Global.P10J1 = num
	elif Global.select == 39:
		Global.P10J2 = num
	elif Global.select == 40:
		Global.P10J3 = num
	elif Global.select == 42:
		Global.P11J1 = num
	elif Global.select == 43:
		Global.P11J2 = num
	elif Global.select == 44:
		Global.P11J3 = num
	elif Global.select == 46:
		Global.P12J1 = num
	elif Global.select == 47:
		Global.P12J2 = num
	elif Global.select == 48:
		Global.P12J3 = num
	else:
		Global.something = false


func _on_score_reset_button_pressed() -> void:
	num = 0
	while tracker < 49:
		Global.select = tracker
		call("number")
		tracker += 1
	tracker = 0


func _on_reset_button_pressed() -> void:
	num = 0
	while tracker < 49:
		Global.select = tracker
		call("number")
		tracker += 1
		if Global.select == 1:
			P1.text = ""
		if Global.select == 5:
			P2.text = ""
		if Global.select == 9:
			P3.text = ""
		if Global.select == 13:
			P4.text = ""
		if Global.select == 17:
			P5.text = ""
		if Global.select == 21:
			P6.text = ""
		if Global.select == 25:
			P7.text = ""
		if Global.select == 29:
			P8.text = ""
		if Global.select == 33:
			P9.text = ""
		if Global.select == 41:
			P10.text = ""
		if Global.select == 45:
			P11.text = ""
		P12.text = ""
	tracker = 0
