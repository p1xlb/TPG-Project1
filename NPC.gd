# NPC.gd - Attach this script to your NPC character node
extends Area2D

# Visual indicator for interaction (optional)
var indicator_sprite: Sprite2D = null

func _ready():
	# Debug message
	print("NPC: _ready() called")
	# Create an interaction indicator (exclamation mark or similar)
	#create_indicator()

# Add a visual indicator above the NPC to show it's interactive
func create_indicator():
	indicator_sprite = Sprite2D.new()
	# You'll need to add your own texture or use a ColorRect
	# indicator_sprite.texture = preload("res://assets/exclamation.png")
	
	# Alternative: Use a ColorRect if no texture
	var indicator = ColorRect.new()
	indicator.size = Vector2(8, 16)
	indicator.position = Vector2(-4, -40)
	indicator.color = Color(1, 1, 0) # Yellow
	add_child(indicator)
	
	# Add animation to make it more visible
	var tween = create_tween()
	tween.tween_property(indicator, "position:y", -45, 0.5)
	tween.tween_property(indicator, "position:y", -40, 0.5)
	tween.set_loops()
