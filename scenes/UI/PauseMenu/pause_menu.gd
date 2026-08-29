extends Control

@onready var credits_text: Label = $CenterContainer/VBoxContainer/CreditsText

func _ready() -> void:
	self.visible = false
	credits_text.visible = false

func _on_resume_pressed() -> void:
	get_tree().paused = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	self.visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	credits_text.visible = !credits_text.visible
