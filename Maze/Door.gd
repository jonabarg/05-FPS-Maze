extends Spatial

var isOpen = false
var checkPlayer = false

func _physics_process(_delta):
	if isOpen:
		if checkPlayer:
			if Input.is_action_pressed("interacting"):
				Global.menu("Good Job!")
			


func unlock():
	isOpen = true
	$Locked.hide()
	$Unlocked.show()





func _on_Door_body_entered(_body):
	checkPlayer = true

func _on_Door_body_exited(_body):
	checkPlayer = false
