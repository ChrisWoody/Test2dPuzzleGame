class_name TestSprite1 extends AnimatedSprite2D

var turnedOn: bool = false

func _on_area_2d_input_event(_viewport:Node, event:InputEvent, _shape_idx:int) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            turnedOn = !turnedOn
            if turnedOn:
                frame = 1
            else:
                frame = 0
