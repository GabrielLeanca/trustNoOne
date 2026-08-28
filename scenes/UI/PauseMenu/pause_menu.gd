extends Control

func _ready() -> void:
	self.visible = false

func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()
