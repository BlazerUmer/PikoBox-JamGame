extends PhysicsBody2D
# Attach this to the root node of your box scene (the root is named "box").
# Made for a RigidBody2D root (pushable + stackable), but also works with
# StaticBody2D or CharacterBody2D.
#
# Expected children:
#   CollisionShape2D   (required)
#   Sprite2D           (optional - stretched to fit the box)
#
# The player sets box_size_px (16 / 32 / 48 / 60) just before the box enters the level.
# The box sizes its own hitbox and picture, so the root node is never scaled
# (scaling a physics body is unreliable).

@export var box_size_px: int = 16


func _ready() -> void:
	add_to_group("boxes")
	scale = Vector2.ONE                          # never scale the body itself

	var size := float(box_size_px)

	var shape_node := get_node_or_null("CollisionShape2D") as CollisionShape2D
	if shape_node:
		var rect := RectangleShape2D.new()       # new shape per box so boxes don't share one
		rect.size = Vector2(size, size)
		shape_node.shape = rect
		shape_node.scale = Vector2.ONE
		shape_node.position = Vector2.ZERO       # hitbox centered on the box's origin
	else:
		push_warning("box needs a child node named CollisionShape2D")

	var sprite := get_node_or_null("Sprite2D") as Sprite2D
	if sprite and sprite.texture:
		sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		# Picture centered exactly on the hitbox, stretched to the same size.
		sprite.centered = true
		sprite.offset = Vector2.ZERO
		sprite.position = Vector2.ZERO
		var art_size := sprite.get_rect().size
		if art_size.x > 0.0 and art_size.y > 0.0:
			sprite.scale = Vector2(size, size) / art_size

	# Physics tweaks so it behaves like a solid crate you can push and stand on.
	# (Going through a plain Node variable avoids Godot's "can't be of type" parser error.)
	var me: Node = self
	if me is RigidBody2D:
		var body := me as RigidBody2D
		body.lock_rotation = true        # never tips over, so it stays a flat platform
		body.continuous_cd = RigidBody2D.CCD_MODE_CAST_RAY   # doesn't clip through floors
