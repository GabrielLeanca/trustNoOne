class_name Oscar
extends Explorer

func _init() -> void:
	name = "Oscar"
	alive = true
	refuses = 0 #number of turns
	tired = false
	agitation = 10 #counter until they act; 0 means something bad will generally happen
	role = "Cartographer"
