
extends AnimatableBody2D


@export var move_distance: Vector2 = Vector2(0, -200)

@export var move_speed: float = 100.0


var start_position: Vector2

var activated: bool = false


func _ready():

	start_position = global_position


func activate():

	if activated:
		return

	activated = true

	var target_position = start_position + move_distance

	var distance = start_position.distance_to(
		target_position
	)

	var duration = distance / maxf(move_speed, 1.0)

	var tween = create_tween()

	tween.tween_property(
		self,
		"global_position",
		target_position,
		duration
	).set_trans(Tween.TRANS_LINEAR)
#one of the last features
