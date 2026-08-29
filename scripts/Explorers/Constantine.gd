class_name Constantine
extends Explorer

func _init() -> void:
	name = "Constantine"
	alive = true
	refuses = 0 #number of turns
	tired = false
	agitation = 0 #counter until they act; 0 means something bad will generally happen
	role = "Doctor"
	goal = "MurderLeader"
	description = "A shorter placeholder for testing"
	portrait = load("res://assets/characterPortraits/constantine.png")
