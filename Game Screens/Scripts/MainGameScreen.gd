extends Node2D



func _ready() -> void :
	loadSavedHabitatsCritters()

# Function that loads all the habitats and critters
func loadSavedHabitatsCritters() -> void :
	# Load the resource that stores all the habitats resources
	var allHabsRes = SaveAutload.saveHabitatCritters.allHabitatsRes.allHabitatsData
	
	# Thr resources are saved in a dictionary with their uniquw id 
	for savedHabitatID in allHabsRes.keys():
		# Extract the resource
		var savedHabitatData = allHabsRes[savedHabitatID]
		# Resource stores the scene path of the habitat so it can be instantiated
		var habitatInstance = load(savedHabitatData.scenePath).instantiate()
		
		# Reassigning the saved habitats data 
		habitatInstance.global_position = savedHabitatData.position
		habitatInstance.habitatData = savedHabitatData
		habitatInstance.habitatID = savedHabitatID
		habitatInstance.add_to_group("Habitats")
		add_child(habitatInstance)
		
		# Habitat's habitatData resource stores an array of its critter's resources
		# reloading those critters and assigning the resources to them
		for critterData in savedHabitatData.habitatCritters:
			var critterScene = load(critterData.scenePath).instantiate()  # e.g., "res://scenes/plants/sunflower.tscn"
			critterScene.critterDataRes = critterData
			habitatInstance.add_child(critterScene)


func _notification(what) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		var allHabFile = SaveAutload.saveHabitatCritters.allHabitatsRes as AllHabitats
		for habitat in get_tree().get_nodes_in_group("Habitats"):
			habitat.habitatData.position = habitat.global_position
			habitat.habitatData.scenePath = habitat.get_scene_file_path()
			allHabFile.allHabitatsData[habitat.habitatID] = habitat.habitatData
			SaveAutload.saveHabitatCritters.writeHabitatsSave()
			


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game Screens/Scenes/CardCollectionScreen.tscn")# Replace with function body.
