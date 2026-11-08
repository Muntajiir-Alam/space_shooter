extends Area2D

var speed: float = 400.0

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	position.y -= speed * delta
	if position.y <= 0:
		queue_free()
	pass
