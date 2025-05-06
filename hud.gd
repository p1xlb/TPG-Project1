extends CanvasLayer

@onready var health_label = $Control/HealthLabel
@onready var banana_label = $Control/BananaLabel

func _ready():
	add_to_group("hud")
	update_health(3)
	update_banana_count(0)

func update_health(value):
	health_label.text = "Health: " + str(value)

func update_banana_count(value):
	banana_label.text = "x " + str(value)
