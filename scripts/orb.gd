extends Area2D

const speed: int = 400
# constant speed for the orb

var direction
# will be modified 
func _process(delta: float) -> void:
	position += direction * speed * delta
