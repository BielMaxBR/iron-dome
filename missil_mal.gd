extends Area2D


const SPEED = 300.0

var trail_pack = preload("res://Trail.tscn")
var bad_trail = preload("res://bad_trail.tres")
var trail: Line2D
var is_dead = false
signal morri

func _ready() -> void:
	trail = trail_pack.instantiate()
	trail.gradient = bad_trail
	trail.remote = self
	get_parent().add_child(trail)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	var velocity = Vector2(-.5,.5) * SPEED * delta
	rotation = velocity.angle()
	position += velocity

	if global_position.y >= 0: 
		dead()

func dead():
	if not is_dead:
		is_dead = true
		if len(morri.get_connections()) > 0:
			morri.emit()
		trail.delete()
		queue_free()
