extends CharacterBody2D

const speed: int = 250


func _process(delta: float) -> void:
	movement(delta)

# movement for sprite/character in all 4 directions 
func movement(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
