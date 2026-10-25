extends Button

func _ready() -> void:
	if OS.has_feature("web"):
		hide()   #gonna export to browser so hiding the exit button
		return
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().quit()
