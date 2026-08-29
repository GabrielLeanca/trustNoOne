class_name EventType

var explorers = Globals.explorers
var items = Globals.items
var options : EventOptions = null
var decisions: Array[Decision] = []

func _init(givenOptions : EventOptions = null):
	options = givenOptions
	if options.arriveAtLocation:
		arrive()

func get_title() -> String:
	return ""

func get_text() -> String:
	return ""

func get_decisions(location: Location = null, route: Route = null) -> Array[Decision]:
	return decisions

func make_decision(decisionIndex : int) -> EventOptions:
	var decision = decisions[decisionIndex]
	return null
	
func arrive():
	options.location.arrive_at()


func create_arrival():
	var arrivalEvent = EventOptions.new(options.location.roomType)
	arrivalEvent.location = options.location
	if arrivalEvent.name == "Rest":
		arrivalEvent.title = "A Safe Place to Make Camp"
		arrivalEvent.text = ""
	arrivalEvent.arriveAtLocation = true
	return arrivalEvent
