extends Node2D

func AddKey(Key):
	var label = Label.new()
	label.text = Key.GetName()
	label.modulate = Color.darkblue
	$Inputs.add_child(label)
	
func UpdateLabel(Key, index):
	$Inputs.get_child(index).text = Key.GetName() + " | timeoff :" + str(Key.timeoff) + " | timepressed : " + str(Key.timepressed)

func RemoveLast(index):
	$Inputs.get_child(index).queue_free()
