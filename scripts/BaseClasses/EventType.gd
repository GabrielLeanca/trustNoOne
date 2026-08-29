class_name EventType

var explorers = Globals.explorers
var items = Globals.items
var options : EventOptions = null
var decisions: Array[Decision] = []

func _init(givenOptions : EventOptions = null):
	options = givenOptions

func get_title() -> String:
	return ""

func get_text() -> String:
	return ""

func get_decisions(location: Location = null, route: Route = null) -> Array[Decision]:
	return []

func make_decision(decisionIndex : int) -> EventOptions:
	var decision = decisions[decisionIndex]
	return null
