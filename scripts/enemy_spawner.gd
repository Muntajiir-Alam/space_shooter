extends Node

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 2.0

@onready var timer: Timer = $Timer


func _ready() -> void:
    timer.wait_time = spawn_interval
    timer.timeout.connect(spawn_enemy)
    timer.start()


func spawn_enemy() -> void:
    var enemy = enemy_scene.instantiate()

    var screen_width := get_viewport().get_visible_rect().size.x

    enemy.global_position = Vector2(
        randf_range(30.0, screen_width - 30.0),
        -50.0
    )

    get_tree().current_scene.add_child(enemy)