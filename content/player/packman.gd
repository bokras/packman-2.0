extends KinematicBody2D
export var speed := 5000
var linear_velocity = Vector2()
var direction = Vector2()
onready var sprite = $sprite


func _input(event) -> void:
	if event.is_action_pressed("right"):
		direction.x = 1
		direction.y = 0
	elif event.is_action_pressed("left"):
		direction.x = -1
		direction.y = 0
	elif event.is_action_pressed("up"):
		direction.x = 0
		direction.y = -1
	if event.is_action_pressed("down"):
		direction.x = 0
		direction.y = 1

func _physics_process(delta) -> void:
	if direction.x >0:
		sprite.rotation_degrees = 0
		sprite.flip_v = false
	elif direction.x <0:
		sprite.flip_v = true
		sprite.rotation_degrees = 180
	elif direction.y >0:
		sprite.rotation_degrees = 90
	elif direction.y <0:
		sprite.rotation_degrees = -90
	linear_velocity = direction * speed * delta
	linear_velocity = move_and_slide(linear_velocity,Vector2.UP)

func set_anim(anim) -> void:
	if sprite.is_playing() == false:
		sprite.play(anim)
