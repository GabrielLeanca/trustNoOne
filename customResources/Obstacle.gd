class_name Obstacle
extends Resource

@export var name: String
@export var eventType: String
@export var image: Texture

func _init(name: String = ""):
	if name != "":
		eventType = "res://scripts/EventTypes/%s.gd"%name
