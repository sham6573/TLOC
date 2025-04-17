extends CharacterBody2D

var health: int = 100
# goblin health
var speed: int = 175
# goblin speed
var player
# an instance of the player to manipulate 
	
func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		print("test")
# handles goblin movement coresponding to the player

#func _on_Area2D_body_entered(body):
	#if body.name == "Player":
		#player = body

#func _on_Area2D_body_exited(body):wa
	#if body == player:
		#player = null

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player = body
		print("e")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
