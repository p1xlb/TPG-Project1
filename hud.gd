extends CanvasLayer

@onready var banana_label = $Control/BananaLabel

func _ready():
	add_to_group("hud")
	update_health(State.player_health)
	update_banana_count(0)

func update_health(value):
	if value == 3:
		$Control/Heart.visible = true
		$Control/Heart2.visible = true
		$Control/Heart3.visible = true
	if value == 2:
		$Control/Heart.visible = true
		$Control/Heart2.visible = true
		$Control/Heart3.visible = false
	if value == 1:
		$Control/Heart.visible = true
		$Control/Heart2.visible = false
		$Control/Heart3.visible = false

func update_banana_count(value):
	banana_label.text = "x " + str(value)
