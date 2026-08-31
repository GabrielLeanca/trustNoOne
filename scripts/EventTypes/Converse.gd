class_name ConverseEvent
extends EventType

func _init(givenOptions : EventOptions = null):
	options = givenOptions
	var decision : Decision = null
	match options.explorer.name:
		"Oscar":
			decision = Decision.new()
			decision.name = "Steal"
			decision.text = "Those maps of his could be useful"
			decision.image = load("res://assets/cards/game_cards_steal_1.png")
			decision.failureChance = 0.5
			decision.itemTargeted
			decisions.append(decision)
		"Constantine":
			pass
		"Bix":
			decision = Decision.new()
			
			decisions.append(decision)
		"Daphne":
			decision = Decision.new()
			decision.name = "Steal"
			decision.text = ""
			decision.image = load("res://assets/cards/game_cards_steal_1.png")
			decision.failureChance = 0.5
			decision.itemTargeted
			decisions.append(decision)
		"Matilda":
			decision = Decision.new()
			
			decisions.append(decision)
		"Richie":
			decision = Decision.new()
			
			decisions.append(decision)
