extends CharacterBody2D

func _ready() -> void:
	if State.chest_interact == true:
		$Apple.visible = true
		$Apple/CollisionShape2D.disabled = false
		$Meat.visible = true
		$Meat/CollisionShape2D.disabled = false
		$Carrot.visible = true
		$Carrot/CollisionShape2D.disabled = false
		$Potion.visible = true
		$Potion/CollisionShape2D.disabled = false
	else:
		return
	
