extends Label
# Attach this to a Label in your level-completion scene.
# Edit the text below in the Inspector. These words get replaced with real numbers:
#   {attempts}  number of attempts it took
#   {time}      time of the successful attempt     (e.g. 0:42.17)
#   {total}     total time across all attempts
#   {best}      fastest successful time on this level

@export_multiline var text_format: String = "Attempts: {attempts}\nTime: {time}\nTotal time: {total}"


func _ready() -> void:
	var stats := get_node_or_null("/root/GameStats")
	if stats == null:
		text = "(GameStats autoload is missing)"
		return

	text = text_format.format({
		"attempts": stats.done_attempts,
		"time": stats.format_time(stats.done_time),
		"total": stats.format_time(stats.done_total_time),
		"best": stats.format_time(stats.done_best_time),
	})
