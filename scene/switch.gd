
extends Area2D

@export var moving_platform: AnimatableBody2D
@export var platform_offset: Vector2 = Vector2(0, -200)
@export var platform_speed: float = 100.0

var activated: bool = false
var platform_start_position: Vector2


func _ready():
	print("SWITCH READY")


	$Sprite2D.hframes = 2
	$Sprite2D.vframes = 1
	$Sprite2D.frame = 0

	
	if moving_platform != null:
		platform_start_position = moving_platform.global_position
		print("PLATFORM FOUND")
	else:
		print("ERROR: PLATFORM NOT CONNECTED")

	
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	print("SOMETHING TOUCHED SWITCH: ", body.name)


	if activated:
		return

	
	if body is CharacterBody2D:
		print("CHARACTERBODY2D DETECTED")

		activated = true

		
		$Sprite2D.frame = 1

		#start moving platform
		move_platform()


func move_platform():
	if moving_platform == null:
		print("ERROR: NO PLATFORM")
		return

	print("PLATFORM MOVING")


	var target_position = platform_start_position + platform_offset

	
	var distance = platform_start_position.distance_to(target_position)

	var duration = distance / maxf(platform_speed, 1.0)

	
	var tween = create_tween()

	#rpeat forever
	tween.set_loops()

	
	tween.tween_property(
		moving_platform,
		"global_position",
		target_position,
		duration
	).set_trans(Tween.TRANS_LINEAR)

	#move platform back to starting position
	tween.tween_property(
		moving_platform,
		"global_position",
		platform_start_position,
		duration
	).set_trans(Tween.TRANS_LINEAR)
