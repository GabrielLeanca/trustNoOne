extends Camera2D

#@export var zoom_speed: float = 0.1
#@export var min_zoom: float = 0.5
#@export var max_zoom: float = 1.0
#@export var keyboard_pan_speed: float = 750.0
#var dragging := false
#var _pan_keys := {
	#KEY_W: false,
	#KEY_A: false,
	#KEY_S: false,
	#KEY_D: false,
#}

#func _ready() -> void:
	#make_current()
	#limit_left = -1000
	#limit_top = -1600
	#limit_right = 1800
	#limit_bottom = 700

#func _input(event: InputEvent) -> void:
	#if event is InputEventKey and not event.echo:
		#var key : Key = event.physical_keycode
		#if key in _pan_keys:
			#_pan_keys[key] = event.pressed
	#elif event is InputEventMouseButton:
		#match event.button_index:
			#MOUSE_BUTTON_RIGHT:
				#dragging = event.pressed
			#MOUSE_BUTTON_MIDDLE:
				#dragging = event.pressed
			#MOUSE_BUTTON_WHEEL_UP:
				#if event.pressed:
					#_apply_zoom(zoom.x + zoom_speed)
					#get_viewport().set_input_as_handled()
			#MOUSE_BUTTON_WHEEL_DOWN:
				#if event.pressed:
					#_apply_zoom(zoom.x - zoom_speed)
					#get_viewport().set_input_as_handled()
	#elif event is InputEventMouseMotion and dragging:
		#global_position -= event.relative / zoom
		#get_viewport().set_input_as_handled()
#
#func _process(delta: float) -> void:
	#var direction := Vector2.ZERO
	#if _pan_keys[KEY_W]:
		#direction.y -= 1
	#if _pan_keys[KEY_S]:
		#direction.y += 1
	#if _pan_keys[KEY_A]:
		#direction.x -= 1
	#if _pan_keys[KEY_D]:
		#direction.x += 1
	#if direction != Vector2.ZERO:
		#global_position += direction.normalized() * keyboard_pan_speed * delta / zoom
#
#func _notification(type: int) -> void:
	#if type == NOTIFICATION_APPLICATION_FOCUS_OUT:
		#for key in _pan_keys:
			#_pan_keys[key] = false
#
#func _get_world_point_under_mouse() -> Vector2:
	#var viewport := get_viewport()
	#var mouse_pos := viewport.get_mouse_position()
	#var viewport_center := viewport.get_visible_rect().size / 2.0
	#return global_position + (mouse_pos - viewport_center) / zoom
#
#func _apply_zoom(new_zoom_value: float) -> void:
	#var old_zoom := zoom.x
	#new_zoom_value = clampf(new_zoom_value, min_zoom, max_zoom)
	#if is_equal_approx(old_zoom, new_zoom_value):
		#return
#
	#var mouse_world := _get_world_point_under_mouse()
	#zoom = Vector2(new_zoom_value, new_zoom_value)
	#global_position += (mouse_world - global_position) * (1.0 - old_zoom / new_zoom_value)
