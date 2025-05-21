extends CharacterBody2D

@export var detection_range = 300.0
@export var shoot_cooldown = 1.5
@export var bullet_speed = 200.0
@export var patrol_animation: String = "run"

var player = null
var can_shoot = true
var is_active = true
var health = 1


@onready var detection_area = $DetectionArea
@onready var bullet_spawn = $BulletSpawn
@onready var animation_player = $AnimatedSprite2D
@onready var sprite = $AnimatedSprite2D

func _ready():
	add_to_group("enemies")
	animation_player.play(patrol_animation)
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]

func _physics_process(delta):
	if not is_active or player == null:
		return
				
	if player in detection_area.get_overlapping_bodies():
		# Face the player
		if player.global_position.x < global_position.x:
			sprite.flip_h = true
			bullet_spawn.position.x = -abs(bullet_spawn.position.x)
		else:
			sprite.flip_h = false
			bullet_spawn.position.x = abs(bullet_spawn.position.x)
		
		if can_shoot:
			animation_player.play("shoot")
			shoot()
			await animation_player.animation_finished
			animation_player.play(patrol_animation)
	else:
		animation_player.play("run")

func shoot():
	can_shoot = false
	var bullet = preload("res://Bullet.tscn").instantiate()
	bullet.global_position = bullet_spawn.global_position
	bullet.direction = -1 if sprite.flip_h else 1
	bullet.speed = bullet_speed
	get_tree().current_scene.add_child(bullet)
	await get_tree().create_timer(shoot_cooldown).timeout
	can_shoot = true

func take_damage():
	health -= 1
	if health <= 0:
		die()

func die():
	is_active = false
	animation_player.play("death")
	# Disable collision
	$CollisionShape2D.disabled = true
	$DetectionArea/CollisionShape2D.disabled = true
	
	# Remove after animation finishes
	await animation_player.animation_finished
	queue_free()
