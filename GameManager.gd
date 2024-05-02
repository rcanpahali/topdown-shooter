extends Node

var wave: int = 1
var enemies_remaining: int = 1
var spawn_count: int = 0
var spawn_points: Array[Node2D] = []
#var level: Node2D
var spawn_timer: Timer
var time_between_spawns: float = 1.0


func _ready() -> void:
	#level = get_tree().get_first_node_in_group("Level")
	spawn_points = get_tree().get_nodes_in_group("Spawn")
	 
