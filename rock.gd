extends Area2D

var direction = 1
var speed = 150.0

func _ready():
	$Sprite2D.flip_h = direction < 0
	
func _physics_process(delta):
	position.x += direction * speed * delta
	position.y += 50 * delta  # Rocks fall in an arc

func _on_body_entered(body):
	if body.has_method("take_damage") and body.name == "Player":
		body.take_damage()
		queue_free()
	elif not body.is_in_group("monkeys"):
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
