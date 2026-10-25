
extends CanvasLayer

const LEVEL_SELECT := "res://scene/Levelselection.tscn"
const MAIN_MENU := "res://scene/main screen.tscn"

@onready var resume_btn: Button = $"CenterContainer/VBoxContainer/resume button"
@onready var select_btn: Button = $"CenterContainer/VBoxContainer/level select button2"
@onready var menu_btn: Button = $"CenterContainer/VBoxContainer/main menu button3"


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()

	resume_btn.pressed.connect(resume)
	select_btn.pressed.connect(_go.bind(LEVEL_SELECT))
	menu_btn.pressed.connect(_go.bind(MAIN_MENU))


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var tree := get_tree()

		if tree == null:
			return

		if tree.paused:
			resume()
		else:
			pause()

		get_viewport().set_input_as_handled()


func pause() -> void:
	var tree := get_tree()

	if tree == null:
		return

	tree.paused = true
	show()


func resume() -> void:
	var tree := get_tree()

	if tree == null:
		return

	tree.paused = false
	hide()


func _go(path: String) -> void:
	var tree := get_tree()

	if tree == null:
		return

	tree.paused = false
	tree.change_scene_to_file(path)
