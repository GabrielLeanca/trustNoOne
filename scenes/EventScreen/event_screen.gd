class_name EventScreen
extends Control

var event: EventType
var decisions: VBoxContainer

var location: Location = null
var route: Route = null
var options :EventOptions = null

func start(newOptions: EventOptions):
	options = newOptions
	if options.location != null:
		location = options.location
	if options.route != null:
		route = options.route
	var script := load(options.path)
	event = script.new(options)
	if options.title != null && options.title != "":
		(get_node("Title") as Label).text = options.title
	else:
		(get_node("Title") as Label).text = event.get_title()
	if options.text != null && options.text != "":
		(get_node("Text") as Label).text = options.text
	else:
		(get_node("Text") as Label).text = event.get_text()
	decisions = get_node("ScrollContainer/Decisions")
	for decision in event.get_decisions():
		var button := Button.new()
		decisions.add_child(button)
		button.pressed.connect(_on_button_pressed.bind(button))
		button.text = decision.text
		button.set_meta("decision", decision)
	if options.isCancelable:
		var cancelButton := Button.new()
		cancelButton.text = "Cancel"
		cancelButton.pressed.connect(_on_button_pressed.bind(cancelButton))
		decisions.add_child(cancelButton)
	elif options.isFinal:
		var cancelButton := Button.new()
		cancelButton.text = "Ok"
		cancelButton.pressed.connect(_on_button_pressed.bind(cancelButton))
		decisions.add_child(cancelButton)
	visible = true



func _on_button_pressed(button):
	if button.text == "Cancel" || button.text == "Ok":
		for child in decisions.get_children():
			child.queue_free()
		if options.eventOverride:
			pass
		visible = false
	else:
		var newOptions = event.make_decision(button.get_index())
		(get_node("Title") as Label).text = ""
		(get_node("Text") as Label).text = ""
		for child in decisions.get_children():
			child.queue_free()
		if newOptions == null:
			visible = false
		else:
			start(newOptions)
