class_name BaseCritter
extends Node2D


var critterCardName : String
var critterDataRes : CritterData
var animatedSprite : AnimatedSprite2D

func _ready() -> void:
	SaveAutload.addNewCritter(critterCardName)
	animatedSprite.play("default")
	
	
