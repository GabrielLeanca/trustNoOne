class_name CloseByEvent
extends EventType

var decisions: Array[String] = []

func _init():
	for explorer in explorers:
		if explorer.role == "Cartographer" && explorer.alive == true && explorer.tired == 0 && explorer.refuses == 0:
			decisions.append("Tell %s to scout ahead"%explorer.name)
	decisions.append("Explore")

func get_title() -> String:
	return "Nearby Location"

func get_text() -> String:
	return "Beyond the buildings and rubble, you can see a larger area. Could it be safe? Could valuables be found there?"

func get_decisions(location: Location = null, route: Route = null) -> Array[String]:
	return decisions

func make_decision(decision: String) -> String:
	return ""
