extends Camera2D


var speed = 300


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			# zoom in
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom *= 1 + 0.1
			# zoom out
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom *= 1 - 0.1
				
			# call the zoom function
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	position += direction * (speed * 1/zoom.x) * delta
