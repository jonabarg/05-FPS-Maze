extends OmniLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GeometryInstance.SHADOW_CASTING_SETTING_DOUBLE_SIDED
