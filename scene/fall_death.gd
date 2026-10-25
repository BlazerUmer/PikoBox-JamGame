extends Area2D
# World border / kill zone. Attach this to an Area2D that has a CollisionShape2D child.
# When the player touches it (or falls into it), the game switches to the death scene.
#
# Place it below the level to catch falls, or use several of them around the edges.

# Pick your death scene in the Inspector (click the folder icon).
@export_file("*.tscn") var death_scene_path: String = ""

# Boxes (RigidBody2D) that fall out of the world are deleted so they don't fall forever.
@export var delete_fallen_boxes: bool = true

var _triggered := false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	# The player is the CharacterBody2D.
	if body is CharacterBody2D:
		_kill_player()
	elif delete_fallen_boxes and body.is_in_group("boxes"):
		body.queue_free()


func _kill_player() -> void:
	if _triggered:
		return                      # make sure it only fires once
	_triggered = true

	if death_scene_path.is_empty():
		push_warning("world_border: pick a Death Scene Path in the Inspector.")
		_triggered = false
		return

	var stats := get_node_or_null("/root/GameStats")
	if stats:
		stats.level_failed()        # stop the attempt timer

	# Deferred, because Godot doesn't allow changing scenes in the middle of a physics step.
	get_tree().change_scene_to_file.call_deferred(death_scene_path)
