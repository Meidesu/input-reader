extends Node

onready var keyLabel: = $keyLabel;
onready var mouseLabel: = $mouseLabel;
onready var joyAxisLabel: = $joyAxisLabel;
onready var joyButtonLabel: = $joybuttonLabel;
onready var nda: = $nda

var buttonList = {
	1: "Left Mouse Button",
	2: "Right Mouse Button",
	3: "Middle Mouse Button",
	8: "Extra Mouse Button 1",
	9: "Extra Mouse Button 2",
	4: "Mouse Wheel Up",
	5: "Mouse Wheel Down",
	6: "Mouse Wheel Left",
	7: "Mouse Wheel Right",
	128: "Extra Mouse Button 1 Mask",
	256: "Extra Mouse Button 2 Mask"
}


func _input(event: InputEvent) -> void:
	
	
	if event is InputEventKey and event.is_pressed():
		var key_event = event as InputEventKey
		var key_text = key_event.as_text()
		
		keyLabel.text = key_text
		print("Tecla pressionada: " + key_text)
	elif event is InputEventMouseButton and event.is_pressed():
		var mouse_event = event as InputEventMouseButton
		var mouse_index = mouse_event.button_index
		
		mouseLabel.text = (buttonList[mouse_index])
		print("Botão do mouse pressionado: " + (buttonList[mouse_index]))
	elif event is InputEventJoypadButton and event.is_pressed():
		var joypad_button_event = event as InputEventJoypadButton
		var button_text = joypad_button_event.as_text()	
		
		joyButtonLabel.text = button_text
		print("Botão do gamepad pressionado: " + button_text)
	elif event is InputEventJoypadMotion and event.is_pressed():
		var joypad_motion_event = event as InputEventJoypadMotion
		var motion_text = joypad_motion_event.as_text()
		
		joyAxisLabel.text = motion_text
		print("Eixo do gamepad movido: " + joypad_motion_event.as_text())

	else:
		var final = event
		var final_text = final.to_string()
		
		nda.text = final_text
		print("Input final: " + final.as_text())
