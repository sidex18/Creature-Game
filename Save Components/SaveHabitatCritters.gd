extends Resource
class_name SaveHabitatCritters


@export var allHabitatsRes : Resource
const SAVEPATH = "user://saveHabitatCritters.tres"


func writeHabitatsSave() -> void :
	ResourceSaver.save(self, SAVEPATH)

static func loadSaveHabitats() -> Resource :
	return ResourceLoader.load(SAVEPATH,"",ResourceLoader.CACHE_MODE_IGNORE)
static func saveHabitatsExists() -> bool :
	return ResourceLoader.exists(SAVEPATH)
	
