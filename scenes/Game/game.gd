class_name Game
extends Node

@onready var pause_menu: Control = $PauseLayer/PauseMenu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.mouse_filter = Control.MOUSE_FILTER_STOP
		pause_menu.visible = !pause_menu.visible

func start_event(eventType: String, targetLocation: Location = null, targetRoute: Route = null) -> void:
	(get_node("EventLayer/EventScreen") as EventScreen).start(eventType, targetLocation, targetRoute)



func _on_ready() -> void:
	(get_node("Board/GameBoard/Map/StartLocation") as Location).arrive_at()

func get_current_location() -> Location:
	for child : Location in get_node("Board/GameBoard/Map").get_children():
		if child.current == true:
			return child
	return null


func _on_button_pressed() -> void:
	get_tree().paused = !get_tree().paused
	pause_menu.mouse_filter = Control.MOUSE_FILTER_STOP
	pause_menu.visible = !pause_menu.visible
