extends Area2D
var habitat 
var selected : bool


func _on_button_pressed() -> void:
	habitat = preload("res://Habitats/Scenes/CatHabitat.tscn").instantiate()
	habitat.habitatData = HabitatData.new()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_number = rng.randi_range(100, 999)
	var habID = "HabitatID_"
	habID = habID + str(random_number)
	habitat.habitatID = habID
	habitat.global_position = get_global_mouse_position()
	call_deferred("add_child", habitat)
	selected = true
	
func _physics_process(delta):
	if selected:
		habitat.global_position = get_global_mouse_position()
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
