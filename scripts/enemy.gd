extends Area2D

@export var speed: float = 150.0
@export var max_health: int = 100

var health: int


func _ready() -> void:
    health = max_health
    position.x = randf_range(0,1156)


func _process(delta: float) -> void:
    position.y += speed * delta
    if position.y >= 700:
        queue_free()

func take_damage(damage: int) -> void:
    health -= damage

    print("Enemy Health:", health)

    if health <= 0:
        destroy()


func destroy() -> void:
    queue_free()