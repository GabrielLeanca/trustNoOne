# EquipmentData.gd
class_name CharacterData
extends Resource

@export var id: String
@export var display_name: String
@export var icon: Texture2D
@export var ability: String
@export var price: int = 0
@export var goal: String
@export var noTargets: int
@export var needsOnlyOneTarget: bool
