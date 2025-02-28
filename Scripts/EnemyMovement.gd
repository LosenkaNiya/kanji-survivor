class_name EnemyMovement


extends CharacterBody2D


var _homing_target: Node = null


func _ready() -> void:
	_homing_target = _find_homing_target()
	if _homing_target == null:
		push_error("Could not find any homing target.")
		return


func _physics_process(_delta: float) -> void:
	velocity = calculate_velocity()
	move_and_slide()


func _find_homing_target() -> Node:
	var players: Array[Node] = get_tree().get_nodes_in_group("ActivePlayers")
	if players.is_empty():
		return null
	
	var closest_player: Node = players[0]
	for player: Node in players.slice(1, players.size()):
		if global_position.distance_squared_to(player.global_position) < global_position.distance_squared_to(closest_player.global_position):
			closest_player = player	
	return closest_player


func calculate_velocity() -> Vector2:
	var direction: Vector2 = global_position.direction_to(_homing_target.global_position)
	var speed: float = global_position.distance_to(_homing_target.global_position)
	return direction * speed

