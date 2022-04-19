extends Spatial


func _physics_process(_delta):
	if Global.panels == 3:
		$End.unlock()
