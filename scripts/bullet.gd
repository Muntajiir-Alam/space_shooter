extends Area2D

@export var speed: float = 400.0
@export var damage: int = 100

func _ready() -> void:
	add_to_group("bullet")


func _process(delta: float) -> void:
	position.y -= speed * delta
	if position.y <= 0:
		queue_free()

