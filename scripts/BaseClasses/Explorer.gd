class_name Explorer

@export var name := ""
@export var alive := true
@export var refuses := 0 #number of turns
@export var tired := false
@export var agitation := 10 #counter until they act; 0 means something bad will generally happen
@export var role := ""

func _init() -> void:
	pass
