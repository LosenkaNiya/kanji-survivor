extends CharacterBody2D

@export var SPEED : float

func _physics_process(delta: float) -> void:
	
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * SPEED * delta
	move_and_slide()
	
