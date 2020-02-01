extends Node2D

onready var KeyScript = load("res://Code/Input/Key.gd")
onready var InputGUI = $"InputGUI"
var Keys = []
enum KeyCode {
	LEFT, RIGHT, UP, DOWN, A, B, C, D, NONE
}
export(bool) var P1

func _ready():
	AddKey(KeyCode.NONE)
	InputGUI.AddKey(Keys[0])

func _process(delta):
	var keytmp = KeyCode.NONE
	Keys[0].timeoff += delta
	
	InputGUI.UpdateLabel(Keys[0], Keys.size()-1)
	
	if P1:
		if Input.is_action_pressed("LEFTP1"):
			keytmp = KeyCode.LEFT
		if Input.is_action_pressed("RIGHTP1"):
			keytmp = KeyCode.RIGHT
		if Input.is_action_pressed("TOPP1"):
			keytmp = KeyCode.UP
		if Input.is_action_pressed("DOWNP1"):
			keytmp = KeyCode.DOWN
		if Input.is_action_pressed("AP1"):
			keytmp = KeyCode.A
		if Input.is_action_pressed("BP1"):
			keytmp = KeyCode.B
		if Input.is_action_pressed("CP1"):
			keytmp = KeyCode.C
		if Input.is_action_pressed("DP1"):
			keytmp = KeyCode.D
	
	if keytmp != KeyCode.NONE:
		if Keys[0].timeoff > 0.1:
			AddKey(keytmp)
			InputGUI.AddKey(Keys[0])
		else:
			if Keys[0].key == keytmp:
				Keys[0].timepressed += delta
				Keys[0].timeoff = 0
			else:
				AddKey(keytmp)
				InputGUI.AddKey(Keys[0])

func AddKey(key):
	var keyscript = KeyScript.new()
	keyscript.key = key
	Keys.insert(0, keyscript)
	
	if len(Keys) > 10:
		Keys.remove(Keys.size()-1)
		InputGUI.RemoveLast(0)
