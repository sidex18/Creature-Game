class_name BaseCritterCard
extends TextureButton

@export var critter : PackedScene
signal _buying_a_critter(critterToCreate : PackedScene)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _on_pressed() -> void:
	_buying_a_critter.emit(critter) # Replace with function body.
