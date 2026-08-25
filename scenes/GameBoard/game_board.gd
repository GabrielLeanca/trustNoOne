extends Node2D

var camera2d
var routes = [
	{"start":1, "end":2, "obstacles":["darkness"], "isOneWay":true},
	{},
	{}
]

func _on_ready() -> void:
	camera2d = get_node("Camera2D")
