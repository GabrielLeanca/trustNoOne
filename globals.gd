extends Node

var EVENT_TYPES = {
	"darkness": null,
	"walk": null,
	"Nearby": "res://scripts/EventTypes/Nearby.gd"
}

var characterList = ["Oscar"]
var initialCharactersAvailable = ["Oscar"]
var actionList = []
var initialCardsAvailable = ["Murder"]

var explorers : Array[Explorer]
var cards : Array[CardType]
var items : Array[Item] = []

var charactersAvailable = []
var cardsAvailable = []
var isFirstGame = true #if we want more runs, make these be read from file


func _init() -> void:
	#read value of isFirstGame here
	if isFirstGame:
		charactersAvailable = initialCharactersAvailable
		cardsAvailable = initialCardsAvailable
		setExplorerRoster()

func setExplorerRoster():
	for name in charactersAvailable:
		var path = "res://scripts/Explorers/%s.gd" % name
		var script = load(path)
		var explorer = script.new()
		explorers.append(explorer)
	for name in cardsAvailable:
		var path = "res://scripts/Cards/%s.gd" % name
		var script = load(path)
		var card = script.new()
		cards.append(card)
