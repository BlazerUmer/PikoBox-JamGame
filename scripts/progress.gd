extends Node

const SAVE_PATH := "user://progress.cfg"
var unlocked_levels := 1

func _ready() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(SAVE_PATH) == OK:
		unlocked_levels = cfg.get_value("progress", "unlocked", 1)

func complete_level(n: int) -> void:
	if n >= unlocked_levels:
		unlocked_levels = n + 1
		var cfg := ConfigFile.new()
		cfg.set_value("progress", "unlocked", unlocked_levels)
		cfg.save(SAVE_PATH)
		#logic was hard for this
