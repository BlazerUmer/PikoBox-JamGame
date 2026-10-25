extends Control

func _ready() -> void:
	get_tree().paused = false
#game was breaking without this
