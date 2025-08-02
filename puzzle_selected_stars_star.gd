class_name SelectedStar extends Sprite2D

signal toggled()

var colorCollection: Array = [
    Color(1, 1, 1, 1),  # White
    Color(1, 0, 0, 1),  # Red
    Color(0, 1, 0, 1),  # Green
    Color(0, 0, 1, 1)   # Blue
]
var colorIndex: int = 0
var active: bool = false
var puzzleCompleted: bool = false

func _on_area_2d_input_event(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    if not active || puzzleCompleted:
        return

    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            colorIndex += 1
            if colorIndex >= colorCollection.size():
                colorIndex = 0
            modulate = colorCollection[colorIndex]
            emit_signal("toggled")

func setPuzzleCompleted() -> void:
    puzzleCompleted = true

func setActive() -> void:
    active = true
    colorIndex = 0
    modulate = colorCollection[colorIndex]

func setInActive() -> void:
    active = false
    colorIndex = 0
    modulate = colorCollection[colorIndex]