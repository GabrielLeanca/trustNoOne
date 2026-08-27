extends Node

@onready var pause_menu: Control = $PauseLayer/PauseMenu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = !pause_menu.visible
