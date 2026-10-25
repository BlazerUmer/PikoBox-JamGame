extends Node


var current_level: String = ""        #path of the level being played
var attempts: int = 0                 #attempts on the current level (including this one)
var attempt_time: float = 0.0         #seconds spent on the current attempt
var total_time: float = 0.0           #seconds spent on this level across ALL attempts
var running: bool = false            

var best_times: Dictionary = {}       #level path -> fastest single attempt (seconds)
var last_was_best: bool = false       

#frozen results from the last completion, so labels can show them on the completion screen.
var done_attempts: int = 0
var done_time: float = 0.0
var done_total_time: float = 0.0
var done_best_time: float = 0.0


func _process(delta: float) -> void:
	if running:
		attempt_time += delta
		total_time += delta



func start_level(level_path: String) -> void:
	if level_path != current_level:
		# A different level: start fresh.
		current_level = level_path
		attempts = 0
		total_time = 0.0
	attempts += 1                    
	attempt_time = 0.0
	running = true



func level_failed() -> void:
	running = false



func level_completed() -> void:
	running = false
	done_attempts = attempts
	done_time = attempt_time
	done_total_time = total_time

	var previous_best: float = best_times.get(current_level, INF)
	last_was_best = attempt_time < previous_best
	if last_was_best:
		best_times[current_level] = attempt_time
	done_best_time = best_times[current_level]



func retry() -> void:
	if current_level.is_empty():
		push_warning("GameStats: no level to retry yet.")
		return
	get_tree().change_scene_to_file.call_deferred(current_level)



func format_time(seconds: float) -> String:
	var minutes := int(seconds / 60.0)
	var secs := fmod(seconds, 60.0)
	return "%d:%05.2f" % [minutes, secs]
