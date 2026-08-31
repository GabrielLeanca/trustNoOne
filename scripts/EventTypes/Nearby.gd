class_name NearbyEvent
extends EventType

func _init(givenOptions : EventOptions = null):
	options = givenOptions
	for explorer in explorers:
		if explorer.role == "Cartographer" && explorer.alive == true && explorer.tired == 0 && explorer.refuses == 0:
			var decision : Decision = Decision.new()
			decision.location = options.location
			decision.explorerOrdered = explorer
			decision.name = "OrderCartographer"
			decision.text = "Tell %s to scout ahead"%explorer.name
			decisions.append(decision)
	var decision : Decision = Decision.new()
	decision.location = options.location
	decision.name = "Explore"
	decision.text = "Explore"
	decisions.append(decision)

func get_title() -> String:
	return "Nearby Location"

func get_text() -> String:
	return "Beyond the buildings and rubble, you can see a larger area. Could it be safe? Could valuables be found there?"

func get_decisions(location: Location = null, route: Route = null) -> Array[Decision]:
	return decisions

func make_decision(decisionIndex : int) -> EventOptions:
	var decision = decisions[decisionIndex]
	var newEvent : EventOptions = null
	if decision.name == "OrderCartographer":
		decision.explorerOrdered.agitation += 3
		decision.explorerOrdered.tired += 3
		newEvent = EventOptions.new("Information")
		newEvent.title = "Cartographer returns"
		newEvent.explorer = decision.explorerOrdered
		var text = "%s returns. It is obvious that he went through a lot trying to scout the area on his own. Despite his usual attitude towards exploration, it is obvious that he wishes this particular expedition to end.\n He tells me that the next location could have been used for %s\n"%[newEvent.explorer.name, options.location.roomType]
		var dangersString
		if options.route.obstacles == null || options.route.obstacles == []:
			dangersString = "He did, however, verify that there are no obstacles between us and that place."
			text += dangersString
		else:
			dangersString = "Even the best route he spotted has obstacles: "
			for obstacle in options.route.obstacles:
				dangersString += obstacle.name
				dangersString += ", "
			text += dangersString.substr(0, dangersString.length() - 2)
		text += "\n This explorer has grown more agitated"
		text += "\n This explorer is tired"
				
		newEvent.text = text
		newEvent.isFinal = true
	if decision.name == "Explore":
		(Engine.get_main_loop().current_scene.get_current_location() as Location).move_away()
		newEvent = getNextRouteEventOptions()
	return newEvent
