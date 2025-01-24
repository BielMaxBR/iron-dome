extends Area2D


const SPEED = 400.0
const MAX_ANGLE = 90
var target_angle: float
var trail_pack = preload("res://Trail.tscn")
var boom_pack = preload("res://boom.tscn")
var good_trail = preload("res://good_trail.tres")
@export var alvo: Node2D
signal morri
var trail: Line2D

func _ready() -> void:
	trail = trail_pack.instantiate()
	trail.gradient = good_trail
	trail.remote = self
	get_parent().add_child(trail)

func bom():
	var boom: Area2D = boom_pack.instantiate()
	boom.global_position = global_position
	get_parent().call_deferred("add_child",boom)
	morri.emit(alvo)
	trail.delete()
	queue_free()

func _physics_process(delta: float) -> void:
	if is_instance_valid(alvo):
		target_angle = global_position.angle_to_point(alvo.global_position)
	#rotation = lerp_angle(rotation, target_angle, 2 * delta)
	rotation = lerp_angle(rotation, target_angle, deg_to_rad(MAX_ANGLE) * delta)
	#print(rotation)
	var velocity = Vector2.RIGHT.rotated(rotation) * SPEED * delta
	position += velocity


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("maligno"):
		#$Area2D/CollisionShape2D.disabled = true
		bom()
