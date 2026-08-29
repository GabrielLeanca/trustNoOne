class_name Decision
extends Resource

var hasTarget : bool = false
var hasItemTarget : bool = false

@export var name := ""
@export var text := ""
@export var image : Texture = null

var explorerOrdered : Explorer = null
var itemUsed: Item = null

var explorerTargeted : Explorer = null
var itemTargeted : Item = null


var obstacle : Obstacle = null
var location : Location = null
var route : Route = null

var hasFailureChance : bool = false
var failureChance : float = 0
var nextEvent : EventType = null
var failureEvent : EventType = null

func _init():
	pass
