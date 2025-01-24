extends Node2D

var mal = preload("res://missil_mal.tscn")

func spawn_mals():
	var inst = mal.instantiate()
	inst.global_position = $Mals.global_position
	inst.global_position.x += randi_range(-1000,1000)
	add_child(inst)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	spawn_mals()
