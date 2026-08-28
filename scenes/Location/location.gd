class_name Location
extends Node2D

var discovered := false
var closeBy := false
@export var roomImage: Texture2D
@export var roomType: String
var game_board : GameBoard

var availableRoutesLocationPairs : Array[Dictionary] = []


func _on_ready() -> void:
	game_board = get_parent().get_parent()

func arrive_at() -> void:
	discovered = true
	for route in game_board.routes:
		if self == route.location1:
			availableRoutesLocationPairs.append({"route":route,"location":route.location2})
			route.location2.make_adjacent()
		if self == route.location2:
			availableRoutesLocationPairs.append({"route":route,"location":route.location1})
			route.location1.make_adjacent()

func make_adjacent() -> void:
	if !closeBy && !discovered:
		closeBy = true
		(get_node("Area2D/Sprite2D") as Sprite2D).texture = load("res://assets/locations/game_rooms_unknown_1.png")

func make_not_adjacent() -> void:
	if closeBy && !discovered:
		closeBy = false
		(get_node("Area2D/Sprite2D") as Sprite2D).texture = load("res://assets/locations/game_rooms_unknown_4.png")

func move_away() -> void:
	for item in availableRoutesLocationPairs:
		(item.get("location") as Location).make_not_adjacent()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.button_index == MOUSE_BUTTON_LEFT:
		if closeBy && !discovered:
			pass
		if discovered:
			pass
