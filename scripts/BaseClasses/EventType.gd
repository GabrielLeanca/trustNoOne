class_name EventType

var explorers = Globals.explorers
var items = Globals.items

func _init():
	pass

func get_title() -> String:
	return ""

func get_text() -> String:
	return ""

func get_decisions(location: Location = null, route: Route = null) -> Array[String]:
	return []

func make_decision(decision: String) -> String:
	return ""
