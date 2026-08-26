extends Node2D

var camera2d
var map
var locations
var routes = [
	{"start":1, "end":2, "obstacles":["darkness"], "isOneWay":true},
	{"start":1, "end":3, "obstacles":["darkness"], "isOneWay":false},
	{"start":1, "end":4, "obstacles":["darkness"], "isOneWay":true}
]

func _on_ready() -> void:
	camera2d = get_node("Camera2D")
	map = get_node("Map")
	locations = map.get_children()
	
	for route in routes:
		pass
