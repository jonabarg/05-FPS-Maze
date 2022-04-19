extends Spatial


var panels = get_children()

var badPanel

func updatePanels():
	Global.panels += 1
	panels = get_children()
	for panel in panels:
		panel.updatePanel()


func _on_Timer_timeout():
	panels = get_children()
	for panel in panels:
		panel.resetDamage()
	badPanel = panels[int(randf() * panels.size())]
	badPanel.makeBad()
