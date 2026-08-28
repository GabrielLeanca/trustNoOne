class_name CloseByEvent
extends EventType

var decisions: Array[String] = []

func get_title() -> String:
	return "Nearby Location"

func get_text() -> String:
	return "Beyond the buildings and rubble, you can see a larger area. Could it be safe? Could valuables be found there?"

func get_decisions() -> Array[String]:
	return []

func make_decision(decision: String) -> String:
	return ""
