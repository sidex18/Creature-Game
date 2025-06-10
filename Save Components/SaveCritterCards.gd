class_name SaveCritterCards
extends Resource



@export var uniqueCrittersRes : Resource

const SAVEPATH = "user://saveCritterCards.tres"


	

static func saveCritterCardsExists() -> bool :
	return ResourceLoader.exists(SAVEPATH)


static func loadSaveCritterCards() -> Resource :
	return ResourceLoader.load(SAVEPATH,"",ResourceLoader.CACHE_MODE_IGNORE)

func writeSaveCritterCardFile() -> void :
	ResourceSaver.save(self, SAVEPATH)

	pass
	
