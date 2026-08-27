extends Node


@onready var hud_root: Control = $HudLayer/HudRoot
@onready var pause_root: Control = $PauseLayer/PauseRoot

var pause_menu = preload("res://scenes/UI/PauseMenu/pause_menu.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var tree = get_tree()
		if tree.paused == false:
			pause_root.add_child(pause_menu.instantiate())
			tree.paused = true
