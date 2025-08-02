class_name CircleToggle extends Sprite2D

@export var movingLineTop: MovingLine
@export var movingLineBottom: MovingLine
@export var movingLineLeft: MovingLine
@export var movingLineRight: MovingLine

@export var toggleUp := true

func _ready() -> void:
    movingLineTop.connect("alwaysOnOrOff", processToggle)
    movingLineBottom.connect("alwaysOnOrOff", processToggle)
    movingLineLeft.connect("alwaysOnOrOff", processToggle)
    movingLineRight.connect("alwaysOnOrOff", processToggle)
    processToggle(false)

func _on_area_2d_input_event(_viewport:Node, event:InputEvent, _shape_idx:int) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            toggleUp = !toggleUp
            processToggle(false)

func processToggle(turnedOn: bool) -> void:
    movingLineTop.setTurnedOn(false)
    movingLineBottom.setTurnedOn(false)
    movingLineLeft.setTurnedOn(false)
    movingLineRight.setTurnedOn(false)

    if toggleUp:
        rotation_degrees = 0
        if movingLineTop.alwaysOn:
            movingLineBottom.setTurnedOn(true)
        elif movingLineBottom.alwaysOn:
            movingLineTop.setTurnedOn(true)
    else:
        rotation_degrees = 90
        if movingLineLeft.alwaysOn:
            movingLineRight.setTurnedOn(true)
        elif movingLineRight.alwaysOn:
            movingLineLeft.setTurnedOn(true)
