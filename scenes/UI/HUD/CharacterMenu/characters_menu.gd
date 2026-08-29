extends Control

@onready var character_card = $CenterContainer/HBoxContainer/CharacterCard
var c_idx = 0;

func _ready() -> void:
	self.visible = false
	view_character()

func _on_left_pressed() -> void:
	c_idx = clamp(c_idx - 1, 0, Globals.explorers.size() - 1)
	view_character()

func _on_right_pressed() -> void:
	c_idx = clamp(c_idx + 1, 0, Globals.explorers.size() - 1)
	view_character()

func view_character():
	character_card.character = Globals.explorers[c_idx]
	character_card.view()
