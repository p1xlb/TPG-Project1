extends CharacterBody2D

@export var detection_range = 400.0
@export var throw_cooldown = 2.0
@export var rock_speed = 150.0

var player = null
var can_throw = true
var is_active = true
var is_pacified = false

@onready var detection_area = $DetectionArea
@onready var rock_spawn = $RockSpawn
@onready var animation_player = $AnimatedSprite2D
@onready var sprite = $AnimatedSprite2D

func _ready():
	add_to_group("monkeys")
	animation_player.play("idle")
	
	# Make sure the Area2D has proper collision detection
	if has_node("Area2D"):
		var area = get_node("Area2D")
		# Check if we have collision shapes, add one if needed
		var has_collision = false
		for child in area.get_children():
			if child is CollisionShape2D or child is CollisionPolygon2D:
				has_collision = true
				break
				
		if not has_collision:
			print("Warning: Monkey's Area2D has no collision shape!")

func _physics_process(delta):
	if not is_active or is_pacified:
		return
		
	if player and detection_area.get_overlapping_bodies().has(player):
		# Face the player
		if player.global_position.x < global_position.x:
			sprite.flip_h = true
			rock_spawn.position.x = -abs(rock_spawn.position.x)
		else:
			sprite.flip_h = false
			rock_spawn.position.x = abs(rock_spawn.position.x)
		
		if can_throw:
			animation_player.play("throw")
			throw_rock()
			# Will call throw_rock() at the appropriate animation frame using animation_player call_method track

func throw_rock():
	if is_pacified:
		return
		
	can_throw = false
	var rock = preload("res://Rock.tscn").instantiate()
	rock.global_position = rock_spawn.global_position
	rock.direction = -1 if sprite.flip_h else 1
	rock.speed = rock_speed
	get_tree().current_scene.add_child(rock)
	#$ThrowSound.play()
	
	# Start cooldown
	await get_tree().create_timer(throw_cooldown).timeout
	can_throw = true

func pacify():
	is_pacified = true
	animation_player.play("happy")
	print("Monkey pacified!") # Debug message
	#$PacifiedParticles.emitting = true
	#$HappySound.play()
	# Make the monkey stop throwing rocks
	await get_tree().create_timer(10.0).timeout
	is_pacified = false
	animation_player.play("idle")
	print("Monkey no longer pacified!")
