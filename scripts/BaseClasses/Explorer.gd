class_name Explorer

@export var name := ""
@export var alive := true
@export var refuses := 0 #number of turns
@export var tired := false
@export var agitation := 0 #counter until they act; 0 means something bad will generally happen
@export var role := ""
@export var goal := ""
@export var description := ""
@export var portrait : Texture

func _init() -> void:
	pass
