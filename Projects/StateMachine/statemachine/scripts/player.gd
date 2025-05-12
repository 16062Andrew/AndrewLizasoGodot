extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var gravity = 100

@onready var Jump_Key = $HUD/UI/Jump_Key
@onready var Height = $HUD/UI/Height
@onready var Stage = $HUD/UI/Stage
@onready var Min = $HUD/UI/Panel/Min
@onready var Sec = $HUD/UI/Panel/Sec
@onready var Insult = $HUD/UI/Insults
@onready var MiliSec = $HUD/UI/Panel/MiliSec
@onready var Camera = $"../CharacterBody2D/Camera2D"
@onready var Main = $".."
@onready var Controls = $HUD/Control
@onready var Jump = $HUD/Control/Jump
@onready var Left = $HUD/Control/Left
@onready var Right = $HUD/Control/Right

var SpeedConst = 300
var XScaleConst = self.scale.x
var YScaleConst = self.scale.y

var rng = RandomNumberGenerator.new()
var jump = ["SPACE_BAR", "KEY_1", "KEY_2", "KEY_3", "KEY_4", "KEY_5", "KEY_6", "KEY_7", "KEY_8", "KEY_9", "KEY_0", "KEY_BACKSPACE", "KEY_TAB", "KEY_UNDERSCORE","KEY_PLUS","KEY_SHIFT","KEY_APOSTROPHE","KEY_BRACKETLEFT","KEY_BRACKETRIGHT","KEY_BACKSLASH","KEY_SEMICOLON","KEY_ENTER","KEY_CTRL","KEY_ALT","KEY_Q","KEY_W","KEY_E","KEY_R","KEY_T","KEY_Y","KEY_U","KEY_I","KEY_O","KEY_P","KEY_A","KEY_S","KEY_D","KEY_F","KEY_G","KEY_H","KEY_J","KEY_K","KEY_L","KEY_Z","KEY_X","KEY_C","KEY_V","KEY_B","KEY_N","KEY_M","KEY_COMMA","KEY_PERIOD","KEY_SLASH"]
var jump_index = rng.randi_range(0, jump.size() - 1)
var stage_num = 1

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var mseconds: int = 0

var posxnew = 0
var posxold = 1

var height_new = 0
var height_last = 0
var insults = [
	"I am disappointed in you.",
	"How is the weather down there?",
	"Only 5 levels?  Easy…",
	"Your mother would be disappointed.",
	"What! You can’t do something as simple as jumping?",
	"BWOMP",
	"Psst… You are supposed to go up.",
	"My cat could do better than you.",
	"Yikes!",
	"Wrong way.",
	"Good job, are you even trying?",
	"You get a Z for effort.",
	"If you smell like you play, everyone would leave the room."
]

func _ready() -> void:
	rng.randomize()
	print(jump[jump_index])
	Jump_Key.text = "Jump Key: %s" % jump[jump_index]
	if Global.mobile:
		Controls.visible = true
		Jump.disabled = false
		Left.disabled = false
		Right.disabled = false
		Jump_Key.visible = false
	else:
		Controls.visible = false
		Jump.disabled = true
		Left.disabled = true
		Right.disabled = true
		Jump_Key.visible = true

func _physics_process(delta: float) -> void:
	
	if is_on_floor():
		height_new = -(self.position.y)
		if height_new < (height_last - 100):
			var insult_index = rng.randi_range(0, insults.size() - 1)
			Insult.text = insults[insult_index]
		height_last = height_new
	
	time += delta
	mseconds = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	Min.text = "%02d:" % minutes
	Sec.text = "%02d." % seconds
	MiliSec.text = "%03d" % mseconds
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var height_val = self.position.y
	Height.text = "Height: %s" % -(height_val)
	Stage.text = "Stage: %s" % stage_num
	
	if -(height_val) < 3700:
		stage_num = 1
		if is_on_floor():
			SPEED = SpeedConst
			self.scale.x = .5
			self.scale.y = .5
			Camera.zoom.x = 1
			Camera.zoom.y = 1
			self.skew = 0
	elif -(height_val) >= 3700 && -(height_val) < 7400:
		stage_num = 2
		if is_on_floor():
			self.scale.x = .5
			self.scale.y = .5
			Camera.zoom.x = 1
			Camera.zoom.y = 1
			self.skew = 0
	elif -(height_val) >= 7400 && -(height_val) < 11100:
		stage_num = 3
		if is_on_floor():
			Camera.zoom.x = 1
			Camera.zoom.y = 1
			self.skew = 0
	elif -(height_val) >= 11100 && -(height_val) < 14800:
		stage_num = 4
		if is_on_floor():
			self.skew = 0
	elif -(height_val) >= 14800:
		stage_num = 5
	
	# Handle jump.
	if Input.is_action_just_pressed(jump[jump_index]) and is_on_floor():
		JUMP_VELOCITY = -(randi() % 2500)
		if stage_num > 1:
			SPEED = randi() % 3000
		if stage_num > 2:
			self.scale.x = randi() % 2 + 1
			self.scale.y = randi() % 2 + 1
		if stage_num > 3:
			Camera.zoom.x = randi() % 2 + 1
			Camera.zoom.y = randi() % 2 + 1
		if stage_num > 4:
			var main_scew = randi() % 90
			if main_scew >= 46:
				main_scew -= 45
				main_scew = -(main_scew)
			self.skew = main_scew
		velocity.y = JUMP_VELOCITY
		jump_index = rng.randi_range(0, jump.size() - 1)
		print(jump[jump_index])
		Jump_Key.text = "Jump Key: %s" % jump[jump_index]

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed("MIDDLEMOUSE"):
		velocity.y = -2500
	if !Global.mobile:
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if Input.is_action_just_pressed("left") ||  Input.is_action_just_pressed("right"):
			posxnew = self.position.x
			if posxnew == posxold:
				self.position.y -= 100
			posxold = posxnew
	
	move_and_slide()


func _on_jump_pressed() -> void:
	if is_on_floor():
		JUMP_VELOCITY = -(randi() % 2500)
		if stage_num > 1:
			SPEED = randi() % 3000
		if stage_num > 2:
			self.scale.x = randi() % 2 + 1
			self.scale.y = randi() % 2 + 1
		if stage_num > 3:
			Camera.zoom.x = randi() % 2 + 1
			Camera.zoom.y = randi() % 2 + 1
		if stage_num > 4:
			var main_scew = randi() % 90
			if main_scew >= 46:
				main_scew -= 45
				main_scew = -(main_scew)
				self.skew = main_scew
		velocity.y = JUMP_VELOCITY
		jump_index = rng.randi_range(0, jump.size() - 1)


func _on_left_button_up() -> void:
	velocity.x = move_toward(velocity.x, 0, SPEED)



func _on_right_button_up() -> void:
	velocity.x = move_toward(velocity.x, 0, SPEED)


func _on_left_button_down() -> void:
	var direction = 1
	velocity.x = direction * SPEED
	posxnew = self.position.x
	if posxnew == posxold:
		self.position.y -= 100
	posxold = posxnew


func _on_right_button_down() -> void:
	var direction = -1
	velocity.x = direction * SPEED
	posxnew = self.position.x
	if posxnew == posxold:
		self.position.y -= 100
	posxold = posxnew
