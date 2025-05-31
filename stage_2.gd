extends Node2D

func _ready() -> void:
	add_to_group("stage2")
	$Tablet.visible = false
	$Tablet/CollisionShape2D.disabled = true
	
func spawn_tablet():
	$Tablet.visible = true
	$Tablet.get_node("CollisionShape2D").set_deferred("disabled", false)
