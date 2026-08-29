extends HScrollBar

func _ready() -> void:
	for i in Globals.items:
		var item_card = TextureRect.new()
		item_card.texture = i.card
		self.add_child(item_card)
