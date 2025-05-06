extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -400.0
@export var health = 3

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var bananas_collected = 0
var facing_right = true

@onready var animation_player = $AnimatedSprite2D
@onready var sprite = $AnimatedSprite2D

func _ready():
	# Make sure the player is in the "player" group
	add_to_group("player")

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		#$JumpSound.play()

	# Get the input direction and handle horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		# Update facing direction
		if direction > 0:
			facing_right = true
			sprite.flip_h = false
		else:
			facing_right = false
			sprite.flip_h = true
		
		if is_on_floor():
			animation_player.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			animation_player.play("idle")
			
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite2D.play("attack")
		#check_for_guardsman_hit()
		await $AnimatedSprite2D.animation_finished
	
	if not is_on_floor():
		animation_player.play("jump")

	move_and_slide()

func collect_banana():
	bananas_collected += 1
	#$CollectSound.play()
	# Notify the HUD to update
	get_tree().call_group("hud", "update_banana_count", bananas_collected)
	print("Banana collected! Total: ", bananas_collected)  # Debug print

func take_damage():
	health -= 1
	#$HurtSound.play()
	# Flash the player to indicate damage
	modulate = Color(1, 0.3, 0.3, 0.7)
	await get_tree().create_timer(0.2).timeout
	modulate = Color(1, 1, 1, 1)
	
	# Notify the HUD to update health
	get_tree().call_group("hud", "update_health", health)
	
	if health <= 0:
		die()

func die():
	# Play death animation
	animation_player.play("death")
	# Disable input
	set_physics_process(false)
	# Reset level after a delay
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene()

func use_banana_on_monkey(monkey):
	if bananas_collected > 0:
		bananas_collected -= 1
		# Notify the HUD to update
		get_tree().call_group("hud", "update_banana_count", bananas_collected)
		monkey.pacify()
		return true
	return false

func _on_attack_area_body_entered(body):
	if body.is_in_group("enemies") and body.has_method("take_damage"):
		body.take_damage()
