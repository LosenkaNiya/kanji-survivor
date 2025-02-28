extends Node2D


@export var PROJECTILE : PackedScene


func _physics_process(delta: float) -> void:
	var target = get_global_mouse_position()
	look_at(target)


func shoot():

	var new_projectile = PROJECTILE.instantiate()
	new_projectile.global_position = %ShootingPoint.global_position
	new_projectile.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_projectile)


func _on_cool_time_timeout() -> void:
	shoot()
