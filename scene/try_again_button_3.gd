extends Button
#autoloading

func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed() -> void:
	var stats := get_node_or_null("/root/GameStats")
	if stats == null:
		push_warning("retry_button: add GameStats in Project Settings -> Globals (Autoload).")
		return

	#unpause and unfreeze
	get_tree().paused = false

	stats.retry()
