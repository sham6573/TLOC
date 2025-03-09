extends Node2D

var orb_scene: PackedScene = preload("res://scenes/orb.tscn")
# creates an orb scene to manipluate 

# when player_orb signal is activated, this will run and create an instance of an orb
func _on_player_orb(pos, dir) -> void:
	var orb = orb_scene.instantiate() as Area2D
	orb.position = pos
	orb.rotation_degrees = dir.angle()
	orb.direction = dir
	$Projectiles.add_child(orb)
	add_child(orb)
	
