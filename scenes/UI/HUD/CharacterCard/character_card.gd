extends VBoxContainer

var character: Explorer = null
@onready var description: Label = $Description
@onready var avatar: TextureRect = $Avatar
@onready var cname: Label = $Name

func view():
	avatar.texture = character.portrait
	cname.text = character.name
	description.text = character.description
