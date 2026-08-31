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

func getNextRouteEventOptions() -> EventOptions:
	var newOptions : EventOptions
	if options.route.obstacles != null && options.route.obstacles.size() > 0:
		newOptions = EventOptions.new(options.route.obstacles[0].name)
	else:
		newOptions = EventOptions.new("Rest")
		newOptions.title = "A Quiet Walk"
		newOptions.text = "The City of Greed is always perilous, but, for now, everything in our path is rather manageable. I could use this moment to have a private talk with one of my fellow explorers"
	newOptions.route = options.route
	newOptions.location = options.location
	return newOptions
