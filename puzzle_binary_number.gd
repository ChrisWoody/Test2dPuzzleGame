class_name PuzzleBinaryNumber extends Sprite2D

@export var movingLineIn: MovingLine
@export var movingLineOut: MovingLine

@export var turnedOnBackground: Sprite2D

@export var button128: Sprite2D
@export var button64: Sprite2D
@export var button32: Sprite2D
@export var button16: Sprite2D
@export var button8: Sprite2D
@export var button4: Sprite2D
@export var button2: Sprite2D
@export var button1: Sprite2D

const WINNING_VALUE: int = 109

var puzzleActive: bool = false
var puzzleCompleted: bool = false

func _ready() -> void:
    movingLineIn.connect("alwaysOnOrOff", OnMovingLineInTurnedOnOrOff) # lazy to fix issue calling correct signal
    modulate = Color(0, 0, 0, 1)  # Set initial transparency
    var buttons: Array = [button128, button64, button32, button16, button8, button4, button2, button1]
    for button in buttons:
        button.modulate = Color(1, 1, 1, 0.2)

func OnMovingLineInTurnedOnOrOff(turnedOn: bool) -> void:
    TogglePuzzleOnOrOff(turnedOn)

func TogglePuzzleOnOrOff(turnedOn: bool) -> void:
    if puzzleCompleted:
        return
    puzzleActive = turnedOn
    if puzzleActive:
        modulate = Color(1, 1, 1, 1)
    else:
        modulate = Color(1, 1, 1, 0.1)

func _128(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button128, event)
func _64(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button64, event)
func _32(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button32, event)
func _16(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button16, event)
func _8(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button8, event)
func _4(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button4, event)
func _2(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button2, event)
func _1(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    process(button1, event)

func process(button: Sprite2D, event: InputEvent) -> void:
    if puzzleCompleted:
        return

    if not puzzleActive or not (movingLineIn.turnedOn or movingLineIn.alwaysOn):
        return

    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            if button.modulate.a == 1.0:
                button.modulate = Color(1, 1, 1, 0.2)
            else:
                button.modulate = Color(1, 1, 1, 1)
            checkPuzzleCompletion()

func checkPuzzleCompletion() -> void:
    if puzzleCompleted:
        return

    var total: int = 0
    if button128.modulate.a == 1.0:
        total += 128
    if button64.modulate.a == 1.0:
        total += 64
    if button32.modulate.a == 1.0:
        total += 32
    if button16.modulate.a == 1.0:
        total += 16
    if button8.modulate.a == 1.0:
        total += 8
    if button4.modulate.a == 1.0:
        total += 4
    if button2.modulate.a == 1.0:
        total += 2
    if button1.modulate.a == 1.0:
        total += 1

    if total == WINNING_VALUE:
        puzzleCompleted = true
        turnedOnBackground.modulate = Color(1, 1, 1, 1)
        movingLineOut.setAlwaysOn()
