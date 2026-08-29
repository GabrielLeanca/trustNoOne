class_name EventOptions
extends Resource

var location: Location = null
var route: Route = null
@export var name: String = ""
@export var path: String = ""
@export var image: Texture = null

var isCancelable : bool = false

func _init(type : String = "") -> void:
	if type != "":
		name = type
		path = "res://scripts/EventTypes/%s.gd"%name
