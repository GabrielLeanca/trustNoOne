extends Node

var EVENT_TYPES = {
	"darkness": null,
	"walk": null,
	"closeBy": "res://scripts/EventTypes/closeBy.gd"
}

var characterList = ["Oscar"]
var initialCharactersAvailable = ["Oscar"]
var actionList = []
var initialCardsAvailable = []


var charactersAvailable = []
var cardsAvailable = []
var isFirstGame = true #if we want more runs, make these be read from file

func _init() -> void:
	#read value of isFirstGame here
	if isFirstGame:
		charactersAvailable = initialCharactersAvailable
		cardsAvailable = initialCharactersAvailable
