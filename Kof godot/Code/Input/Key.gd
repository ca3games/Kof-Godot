var timeoff = 0
enum key_type {
	LEFT, RIGHT, UP, DOWN, A, B, C, D, NONE
}

var key
var timepressed = 0

func GetName():
	match(key):
		key_type.LEFT : return "LEFT"
		key_type.RIGHT : return "RIGHT"
		key_type.UP : return "UP"
		key_type.DOWN : return "DOWN"
		key_type.A : return "A"
		key_type.B : return "B"
		key_type.C : return "C"
		key_type.D : return "D"
		key_type.NONE : return "NONE"
