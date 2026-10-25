extends Node2D
#tells game new attempt has started
func _ready() -> void:
	var stats := get_node_or_null("/root/GameStats")
	if stats == null:
		push_warning("level.gd: add GameStats in Project Settings -> Globals (Autoload).")
		return
	stats.start_level(scene_file_path)
