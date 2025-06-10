extends Node

# Save Components
var saveCards : SaveCritterCards
var saveHabitatCritters : SaveHabitatCritters
var saveItems : SaveGameItems

# Save Components Resources
var currUniqueCritters : UniqueCritters
var currAllHabitats : AllHabitats

func _ready() -> void:
	loadOrCreateSaveComponents()

func loadOrCreateSaveComponents() -> void :
	if SaveCritterCards.saveCritterCardsExists() :
		saveCards = SaveCritterCards.loadSaveCritterCards() as SaveCritterCards
		currUniqueCritters = saveCards.uniqueCrittersRes as UniqueCritters
	else :
		saveCards = SaveCritterCards.new() 
		currUniqueCritters = UniqueCritters.new()
		saveCards.uniqueCrittersRes = currUniqueCritters
	if SaveHabitatCritters.saveHabitatsExists() :
		saveHabitatCritters = SaveHabitatCritters.loadSaveHabitats()
		currAllHabitats = saveHabitatCritters.allHabitatsRes as AllHabitats
	else :
		saveHabitatCritters = SaveHabitatCritters.new() 
		currAllHabitats = AllHabitats.new()
		saveHabitatCritters.allHabitatsRes = currAllHabitats



func _notification(what) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		saveCards.writeSaveCritterCardFile()
		
		


func addNewCritter(critterName : String) -> void : 
	if !currUniqueCritters.uniqueCritters.has(critterName):
		currUniqueCritters.uniqueCritters[critterName] = true	
