extends Area2D

class_name Projectile

var damagePoint: float = 20.0
var speed: float = 25.0
var time_to_live: float = .5

func _ready() -> void:
	body_entered.connect(on_body_entered)
	handle_time_to_live()

func _physics_process(_delta: float) -> void:
	position += transform.x * speed

# Once the projectile is created, this will attach a timer to created node and 
# The timer will trigger remove node action when the timeout happens
func handle_time_to_live() -> void:
	var ttl_timer: Timer = Timer.new()
	add_child(ttl_timer)
	ttl_timer.wait_time = time_to_live
	ttl_timer.one_shot = true
	ttl_timer.timeout.connect(remove_node) # Trigger this method when the timer reaches zero
	ttl_timer.start()

func on_body_entered(body: Node2D) -> void:
	if body is PlayerCharacter: # Avoid collading with our own character 
		return
	if body is Enemy:
		var enemy = body as Enemy # Add type safety to get proper function definition
		enemy.apply_damage(damagePoint)
	queue_free() # When this is called, the node is removed from the scene

func remove_node() -> void:
	queue_free()
