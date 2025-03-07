extends Sprite2D



const speed: int = 500
# const speed for movement 


func _process(delta: float) -> void:
	movement(delta)

# movement for sprite/character in all 4 directions 
func movement(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position += direction * speed * delta
