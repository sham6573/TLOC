extends CharacterBody2D

const speed: int = 250
# constant speed for player
var health: int = 100
# health of the player
var can_attack: bool = true
# a control boolean 
signal orb(pos, dir)
# a signal to commuicate with other scenes 

func _process(delta: float) -> void:
	movement(delta)
	check_if_shooting()

# movement for sprite/character in all 4 directions 
func movement(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	look_at(get_global_mouse_position())
	move_and_slide()

func check_if_shooting() -> void:
	if(Input.is_action_just_pressed("attack")) and can_attack:
		var orb_location = $Marker2D.global_position
		can_attack = false
		var dir = (get_global_mouse_position() - position).normalized()
		$Timer.start()
		orb.emit(orb_location, dir)
		
	


func _on_timer_timeout() -> void:
	can_attack = true 
