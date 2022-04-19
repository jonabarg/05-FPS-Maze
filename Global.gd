extends Node

var panels = 0
var level = 1
var last = 3
var engine = get_node_or_null("/root/Game/AudioStreamPlayer3D")

func _ready():
	pause_mode = PAUSE_MODE_PROCESS
	engine = get_node_or_null("/root/Game/AudioStreamPlayer3D")
	engine.unit_db = 10 * level
	menu("Welcome!")

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		#get_tree().quit()
		menu("Game Paused")
				
func menu(reason):
	var menu = get_node_or_null("/root/Game/Menu")
	var text = get_node_or_null("/root/Game/Menu/Label")
	var desc = get_node_or_null("/root/Game/Menu/Label2")
	var spawn = get_node_or_null("/root/Game/Menu/Restart")
	if menu != null:
		if not menu.visible:
			text.text = reason
			if reason == "Welcome!":
				spawn.text = "Start"
				desc.show()
			elif reason == "Game Paused":
				desc.text = str(panels) + "/3 Override Panels Activated\nLevel " + str(level) + "/3"
				desc.show()
				spawn.text = "Restart"
			elif reason == "Good Job!":
				if level < last:
					desc.text = "You made it to the next level."
					spawn.text = "Continue"
					level += 1
				else: 
					desc.text = "You made it to the engineering section and saved the day!"
					spawn.text = "Again?"
					level = 0
				desc.show()
			else:
				spawn.text = "Restart"
				desc.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			menu.show()
			get_tree().paused = true 
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			menu.hide()
			get_tree().paused = false
