extends CharacterBody2D

class_name PlayerCharacter

@export var speed_multiplier: int = 1
@export var projectile: PackedScene
@onready var spawn_point: Marker2D = $SpawnPoint
var MOVE_SPEED: float = 500.0

func _physics_process(_delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	move()	
	if Input.is_action_just_pressed("shoot"): shoot()
	
func move() -> void:
	var movement: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("move_up"): 
		movement.y -= 1.0
	if Input.is_action_pressed("move_down"):
		movement.y += 1.0
	if Input.is_action_pressed("move_left"):
		movement.x -= 1.0
	if Input.is_action_pressed("move_right"):
		movement.x += 1.0
	velocity = movement * (MOVE_SPEED * speed_multiplier)
	move_and_slide()

func shoot() -> void:
	var instance: Projectile = projectile.instantiate() # create a new packed scene
	owner.add_child(instance) # add scene to the current instance as a child node
	instance.transform = spawn_point.global_transform # set the `global_transform` reference
