class_name RotatingStar extends Sprite2D

func _on_area_2d_input_event(_viewport:Node, event:InputEvent, _shape_idx:int) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            rotation_degrees += 90  # Rotate the star by 45 degrees on each click