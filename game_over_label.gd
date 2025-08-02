class_name GameOverLabel extends Label

@export var movingLineIn: MovingLine

func _ready() -> void:
    movingLineIn.connect("alwaysOnOrOff", OnMovingLineInTurnedOnOrOff) # lazy to fix issue calling correct signal
    modulate = Color(1, 1, 1, 0.0)  # Set initial transparency

func OnMovingLineInTurnedOnOrOff(turnedOn: bool) -> void:
    if turnedOn:
        modulate = Color(0, 0, 0, 1)  # Fully visible
    else:
        modulate = Color(1, 1, 1, 0.0)  # Fully transparent