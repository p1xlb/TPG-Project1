extends Node2D

@onready var player = $Player

func _ready():
	$Meat.visible = false
	$Meat/CollisionShape2D.disabled = true
	$Apple.visible = false
	$Apple/CollisionShape2D.disabled = true
	$Carrot.visible = false
	$Carrot/CollisionShape2D.disabled = true
	$Potion.visible = false
	$Potion/CollisionShape2D.disabled = true
	
	# Give references to entities that need them
	for guardsman in get_tree().get_nodes_in_group("enemies"):
		guardsman.player = player
	
	for monkey in get_tree().get_nodes_in_group("monkeys"):
		monkey.player = player
		
	print("Level loaded - Entities initialized")

func _input(event):
	# Check for banana use on monkeys
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_global_mouse_position()
		print("Mouse clicked at: ", mouse_pos)
		var monkeys = get_tree().get_nodes_in_group("monkeys")
		print("Found ", monkeys.size(), " monkeys")
		
		for monkey in monkeys:
			if not monkey.has_node("Area2D"):
				print("Warning: Monkey is missing Area2D!")
				continue
				
			var area = monkey.get_node("Area2D")
			var monkey_pos = monkey.global_position
			print("Checking monkey at: ", monkey_pos)
			
			# Simple distance check as a fallback
			var distance = mouse_pos.distance_to(monkey_pos)
			if distance < 50:  # Within 50 pixels of the monkey's center
				print("Clicked near monkey!")
				if player.use_banana_on_monkey(monkey):
					print("Used banana on monkey!")
				return
			
			# Try with collision shape
			var local_point = area.to_local(mouse_pos)
			var clicked_shape = false
			
			for child in area.get_children():
				if child is CollisionShape2D and child.shape != null:
					# Different shapes have different methods
					var shape = child.shape
					
					if shape is CircleShape2D:
						if local_point.length() <= shape.radius:
							clicked_shape = true
							
					elif shape is RectangleShape2D:
						var half_extents = shape.extents
						if abs(local_point.x) <= half_extents.x and abs(local_point.y) <= half_extents.y:
							clicked_shape = true
							
					# For other shapes, do a point-contains check if available
					elif shape.has_method("contains") and shape.contains(local_point):
						clicked_shape = true
						
			if clicked_shape:
				print("Collision shape detected click!")
				if player.use_banana_on_monkey(monkey):
					print("Used banana on monkey!")
				return

func _on_actionables_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player":
		$Apple.visible = true
		$Apple/CollisionShape2D.disabled = false
		$Meat.visible = true
		$Meat/CollisionShape2D.disabled = false
		$Carrot.visible = true
		$Carrot/CollisionShape2D.disabled = false
		$Potion.visible = true
		$Potion/CollisionShape2D.disabled = false
