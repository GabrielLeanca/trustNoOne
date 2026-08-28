class_name GameBoard
extends Node2D

var camera2d
var map
@export var locations: Array[Node]
@export var routes : Array[Route] = []
#var routes = [
	#{"start":1, "end":2, "obstacles":["darkness"], "isOneWay":true},
	#{"start":1, "end":3, "obstacles":["darkness"], "isOneWay":false},
	#{"start":1, "end":4, "obstacles":["darkness"], "isOneWay":true}
#]

func _on_ready() -> void:
	camera2d = get_node("Camera2D")
	map = get_node("Map")
	locations = map.get_children()
	for child in get_node("Routes").get_children():
		routes.append(child as Route)
	
	for route in routes:
		pass

func select_node(node: Node2D) -> void:
	for route : Route in routes:
		if route.location1 == node:
			pass
