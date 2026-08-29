extends VBoxContainer

var character: Explorer = null
@onready var description: Label = $Description
@onready var avatar: TextureRect = $Avatar
@onready var cname: Label = $Name
@onready var role: Label = $RoleContainer/Role
@onready var role_icon: TextureRect = $RoleContainer/Icon

func view():
	avatar.texture = character.portrait
	cname.text = character.name
	description.text = character.description
	role.text = character.role
	role_icon.texture = get_role_icon()

func get_role_icon() -> Texture:
	match character.role:
		"Doctor":
			return load("res://assets/roleIcons/game_popups_doctor.png") as Texture
		"Cartographer":
			return load("res://assets/roleIcons/game_popup_miner.png")
	return null
