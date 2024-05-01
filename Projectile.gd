extends Area2D

class_name Projectile

var damagePoint: float = 20.0
var speed: float = 25.0

func _ready() -> void:
	body_entered.connect(on_body_entered)

func _physics_process(_delta: float) -> void:
	position += transform.x * speed

func on_body_entered(body: Node2D) -> void:
	if body is PlayerCharacter: 
		return
	if body is Enemy:
		var enemy = body as Enemy
		enemy.apply_damage(damagePoint)
		print(enemy.health)
		queue_free()
