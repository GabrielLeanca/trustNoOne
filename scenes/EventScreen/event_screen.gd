class_name EventScreen
extends Control

var event: EventType
var decisions: VBoxContainer

var location: Location = null
var route: Route = null

func start(type: String, givenLocation: Location = null, givenRoute : Route = null):
	if givenLocation != null:
		location = givenLocation
	if givenRoute != null:
		route = givenRoute
	var script := load(type)
	event = script.new()
	(get_node("Title") as Label).text = event.get_title()
	(get_node("Text") as Label).text = event.get_text()
	decisions = get_node("ScrollContainer/Decisions")
	for decision in event.get_decisions():
		var button := Button.new()
		decisions.add_child(button)
		button.pressed.connect(_on_button_pressed.bind(button))
		button.text = decision
	var cancelButton := Button.new()
	cancelButton.text = "Cancel"
	cancelButton.pressed.connect(_on_button_pressed.bind(cancelButton))
	decisions.add_child(cancelButton)
	visible = true



func _on_button_pressed(button):
	if button.text == "Cancel":
		for child in decisions.get_children():
			child.queue_free()
		visible = false
	else:
		event.make_decision(button.get_index())
		(get_node("Title") as Label).text = ""
		(get_node("Text") as Label).text = ""
		for child in decisions.get_children():
			child.queue_free()
