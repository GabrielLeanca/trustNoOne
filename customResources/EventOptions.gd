class_name EventOptions
extends Resource

var location: Location = null
var route: Route = null

var title: String = ""
var text: String = ""
@export var name: String = ""
@export var path: String = ""
@export var image: Texture = null

var isCancelable : bool = false
var isFinal: bool = false
var eventOverride: EventOptions = null #is used for when we want Cancel or Final to go to other events instead

var explorer: Explorer = null

var arriveAtLocation := false


func _init(type : String = "") -> void:
	if type != "":
		name = type
		path = "res://scripts/EventTypes/%s.gd"%name
