class_name RestEvent
extends EventType

func _init(givenOptions : EventOptions = null):
	options = givenOptions
	for explorer in explorers:
		var decision = Decision.new()
		decision.explorerOrdered = explorer
		decision.name = "Converse"
		decision.text = "I'll talk to %s"%explorer.name
		decisions.append(decision)
	if !options.arriveAtLocation:
		var decision = Decision.new()
		decision.name = "Arrive"
		decision.text = "Conversing might give me an idea of someone's agenda, but it might also make them eye my share of all this... Better get to the destination quickly"
		decisions.append(decision)

func make_decision(decisionIndex : int) -> EventOptions:
	var decision = decisions[decisionIndex]
	var newEvent : EventOptions = null
	if decision.name == "Arrive":
		newEvent = create_arrival()
	return newEvent
