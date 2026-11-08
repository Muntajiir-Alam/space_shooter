extends CharacterBody2D

@export var speed_payer: float = 300.0

var screen_size: Vector2 = Vector2(1154, 720)
var player_size: Vector2 = Vector2(50, 60)
var diraction: Vector2 = Vector2(0,0)
var shoot_timer = 0.0
var shoot_counter = 0

var bullet_scene = preload("res://scenes/Bullet.tscn")

func _process(_delta):
	shoot_timer += _delta
	if Input.is_action_just_pressed("shoot") and shoot_timer >= 0.25:
		shoot_timer = 0
		var bullet = bullet_scene.instantiate()
		bullet.position.x = position.x
		bullet.position.y = position.y - 60
		get_parent().get_node("bullets").add_child(bullet)

	if Input.is_action_pressed("move_left"):
		print("press left")
		diraction.x = -1
	elif Input.is_action_pressed("move_right"):
		print("press right")
		diraction.x = 1
	elif Input.is_action_pressed("move_up"):
		print("press up")
		diraction.y = -1
	elif Input.is_action_pressed("move_down"):
		print("press down")
		diraction.y = 1
	else :
		diraction = Vector2(0,0)
	
	position.x += clamp(diraction.x * speed_payer * _delta, 0 - player_size.x / 2, screen_size.x + player_size.x / 2)
	position.y += clamp(diraction.y * speed_payer * _delta, 0 - player_size.y / 2, screen_size.y + player_size.y / 2)
