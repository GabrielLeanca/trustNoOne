class_name Game
extends Node

@onready var pause_menu: Control = $PauseLayer/PauseMenu
@onready var characters_menu: Control = $HudLayer/CharactersMenu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if characters_menu.visible == true:
			pause()
			characters_menu.visible = false
		else:
			pause()
			pause_menu.visible = !pause_menu.visible

func start_event(options: EventOptions) -> void:
	(get_node("EventLayer/EventScreen") as EventScreen).start(options)



func _on_ready() -> void:
	(get_node("Board/GameBoard/Map/StartLocation") as Location).arrive_at()

func get_current_location() -> Location:
	for child : Location in get_node("Board/GameBoard/Map").get_children():
		if child.current == true:
			return child
	return null

func _on_explorers_pressed() -> void:
	pause()
	characters_menu.visible = !characters_menu.visible

func _on_pause_menu_pressed() -> void:
	pause()
	pause_menu.mouse_filter = Control.MOUSE_FILTER_STOP
	pause_menu.visible = !pause_menu.visible

func pause():
	get_tree().paused = !get_tree().paused
