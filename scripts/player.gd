extends CharacterBody2D

var speed: int = 250
# constant speed for player
var health: int = 100
# player health
@export var inv: Inv
# player's inventory
var can_attack: bool = true
# a control boolean 
signal orb(pos, dir)
# a signal to commuicate with orb scene to instancate an orb 
signal prompt
# a signal to emit to create an prompt screen

func _process(delta: float) -> void:
	movement(delta)
	check_if_shooting()

# movement for sprite/character in all 4 directions 
func movement(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	# allows player to be in direction the mouse is in 
	move_and_slide()

# checks if the shot and is possible 
func check_if_shooting() -> void:
	if(Input.is_action_just_pressed("attack")) and can_attack:
		var orb_location = $Marker2D.global_position # where the orb will shoot at
		can_attack = false
		var dir = (get_global_mouse_position() - position).normalized() # gets direction
		$Timer.start()
		prompt.emit()
		#orb.emit(orb_location, dir) # emits signal WILL BE IN AN FUNC 
		
# runs when timer runs out 
func _on_timer_timeout() -> void:
	can_attack = true 
