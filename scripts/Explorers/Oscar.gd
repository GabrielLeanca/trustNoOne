class_name Oscar
extends Explorer

func _init() -> void:
	name = "Oscar"
	alive = true
	refuses = 0 #number of turns
	tired = false
	agitation = 0 #counter until they act; 0 means something bad will generally happen
	role = "Cartographer"
	goal = "MurderLeader"
	description = "placeholder"
	portrait = load("res://assets/characterPortraits/oscar.png")
