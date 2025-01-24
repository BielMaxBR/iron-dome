extends Line2D

@export var lenght = 70
var point := Vector2()
@export var remote: Node2D

var last_position: Vector2

func _physics_process(delta):
	global_position = Vector2.ZERO
	global_rotation = 0
	if is_instance_valid(remote):
		last_position = remote.global_position
	point = last_position#.rotated($Remote.update_rotation)
	
	add_point(point)
	while get_point_count() > lenght:
		remove_point(0)

func delete():
	await get_tree().create_timer(3).timeout
	queue_free()
