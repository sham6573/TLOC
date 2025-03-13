extends Node2D

var orb_scene: PackedScene = preload("res://scenes/orb.tscn")
# creates an orb scene to manipluate 

var prompt_scene: PackedScene = preload("res://scenes/prompt.tscn")
var prompt

# when player_orb signal is activated, this will run and create an instance of an orb
func _on_player_orb(pos, dir) -> void:
	var orb = orb_scene.instantiate()
	orb.position = pos
	orb.rotation_degrees = dir.angle()
	orb.direction = dir
	$Projectiles.add_child(orb)
	prompt.queue_free() # kills the prompt scene 

func _on_player_prompt() -> void:
	prompt = prompt_scene.instantiate()
	$Prompt.add_child(prompt)
