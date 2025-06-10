extends Node2D
class_name BaseHabitat


var habitatData : HabitatData
var habitatSprite : AnimatedSprite2D
var habitatID : String
var collisionArea : Area2D
func _ready() -> void:
	if collisionArea:
		collisionArea.connect("input_event", _on_area_2d_input_event)
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if Input.is_action_pressed("Click") and GameManager.critterPlacing:
		print("Critter Placed")
		var newCritter = GameManager.critterToPlace.instantiate() 
		var res = CritterData.new()
		res.level = 1
		res.scenePath = GameManager.critterToPlace.resource_path
		newCritter.critterDataRes = res
		if habitatData:
			habitatData.habitatCritters.append(res)
		
		var add_later = func():
			add_child(newCritter)
			
			newCritter.global_position = self.global_position
			
		add_later.call_deferred()
