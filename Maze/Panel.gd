extends Spatial

var checkInput = false
var checkBad = false
var used = false
var isBad = false

func _ready():
	updatePanel()

func _physics_process(_delta):
	if isBad:
		#$Shocking.play()
		if $OmniLight.is_visible_in_tree():
			$OmniLight.hide()
		else:
			$OmniLight.show()
	#$Shocking.stop()
			
	if checkBad:
		if isBad:
			Global.menu("You got zapped!")
	
	if checkInput:
		if Input.is_action_pressed("interacting"):
			$Interact.play()
			get_parent().updatePanels()
			checkInput = false
			used = true
		
func updatePanel():
	if Global.panels >= 1:
		$SpotLight.hide()
		$SpotLight3.show()
	if Global.panels >= 2:
		$SpotLight2.show()
		$SpotLight4.hide()
	if Global.panels >= 3:
		$SpotLight6.show()
		$SpotLight5.hide()
func resetDamage():
	isBad = false
	$OmniLight.hide()
	$Shocking.stop()
	
func makeBad():
	isBad = true
	$Shocking.play()
	
func _on_Area_body_entered(_body):
	if not used:
		checkInput = true
	checkBad = true
	#isBad = true


func _on_Area_body_exited(_body):
	checkInput = false
	checkBad = false


func _on_Timer_timeout():
	if used:
		if Global.panels == 1:
			if $SpotLight3.is_visible_in_tree():
				$SpotLight3.hide()
			else:
				$SpotLight3.show()
		if Global.panels == 2:
			if $SpotLight3.is_visible_in_tree():
				$SpotLight3.hide()
				$SpotLight2.hide()
			else:
				$SpotLight3.show()
				$SpotLight2.show()
		if Global.panels == 3:
			if $SpotLight3.is_visible_in_tree():
				$SpotLight3.hide()
				$SpotLight2.hide()
				$SpotLight6.hide()
			else:
				$SpotLight3.show()
				$SpotLight2.show()
				$SpotLight6.show()
			
