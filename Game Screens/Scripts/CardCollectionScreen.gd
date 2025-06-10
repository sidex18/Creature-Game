extends Control


var cardCollection : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initCollection()
	refreshUI()



func refreshUI():
	for critter in SaveAutload.currUniqueCritters.uniqueCritters:
		cardCollection[critter].disabled = false
		
		

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		SaveAutload.saveCards.writeSaveCritterCardFile()
	
	
func initCollection() -> void:
	cardCollection = {"CatCard" : $BaseContainer/MainStoreContainer/ScrollContainer/ShopGrid/Column1/CatCard}

func _gameClosed() -> void :
	SaveAutload.saveCards.writeSaveCritterCardFile()
	


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game Screens/Scenes/MainGameScreen.tscn") # Replace with function body.


func _buying_a_critter(critterToCreate: PackedScene) -> void:
	GameManager.critterToPlace = critterToCreate
	print(critterToCreate)
	GameManager.critterPlacing = true 
	get_tree().change_scene_to_file("res://Game Screens/Scenes/MainGameScreen.tscn")
