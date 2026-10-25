extends Area2D

@export_file("*.tscn") var completion_scene_path: String = ""

var _triggered := false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if not (body is CharacterBody2D) or _triggered:
		return
	if completion_scene_path.is_empty():
		push_warning("level_goal: pick a Completion Scene Path in the Inspector.")
		return
	_triggered = true

	# Level number comes from the scene file name, e.g. level_2.tscn -> 2
	var scene_file := get_tree().current_scene.scene_file_path
	var n := scene_file.get_file().get_basename().trim_prefix("level_").to_int()
	if n > 0:
		Progress.complete_level(n)
	else:
		push_warning("level_goal: scene must be named level_<number>.tscn to unlock the next level.")

	var stats := get_node_or_null("/root/GameStats")
	if stats:
		stats.level_completed()     # freezes attempts + time for the completion screen

	get_tree().change_scene_to_file.call_deferred(completion_scene_path)
