extends CharacterBody2D

class_name Enemy

var health: float = 100.0
var speed: float = 200.0 
var target: PlayerCharacter

func _physics_process(_delta: float) -> void:
	if target == null: 
		target = get_tree().get_nodes_in_group("PlayerGroup")[0] # this will get the all tree and selects the specified `Group` in that node.
	if target != null:
		velocity = position.direction_to(target.position) * speed # velocity: Vector2, change enemy direction to target * give movement
		move_and_slide()
		look_at(target.global_position)

func apply_damage(damage: float) -> void:
	health = clamp(health - damage, 0.0, 100.0)
	if (health == 0.0):
		queue_free()
