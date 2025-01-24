extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func spawn_mals():
	var inst = load("res://missil_mal.tscn").instantiate()
	inst.global_position = $Mals.global_position
	inst.global_position.x += randi_range(-800,800)
	add_child(inst)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	spawn_mals()
