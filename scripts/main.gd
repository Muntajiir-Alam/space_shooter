extends Node2D

var enemy_scene: PackedScene = preload("res://scenes/Enemy.tscn")
var spawner_timer = 0

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	spawner_timer+= delta
	if spawner_timer > 1:
		spawner_timer = 0
		var enemy_instance = enemy_scene.instantiate()
		add_child(enemy_instance)