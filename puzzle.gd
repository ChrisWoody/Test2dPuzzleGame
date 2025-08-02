class_name Puzzle extends Sprite2D

@export var movingLineIn: MovingLine
@export var movingLineOut: MovingLine

@export var square01: Sprite2D
@export var square02: Sprite2D
@export var square03: Sprite2D
@export var square04: Sprite2D
@export var turnedOnBackground: Sprite2D

var puzzleActive: bool = false
var puzzleCompleted: bool = false
var buttonSequence: Array = [1, 3, 2, 4]
var buttonSequenceIndex: int = 0

func _ready() -> void:
    movingLineIn.connect("turnedOnOrOff", OnMovingLineInTurnedOnOrOff)
    modulate = Color(0, 0, 0, 1)  # Set initial transparency

func OnMovingLineInTurnedOnOrOff(turnedOn: bool) -> void:
    TogglePuzzleOnOrOff(turnedOn)

func TogglePuzzleOnOrOff(turnedOn: bool) -> void:
    if puzzleCompleted:
        return
    puzzleActive = turnedOn
    if puzzleActive:
        modulate = Color(1, 1, 1, 1)
    else:
        modulate = Color(0, 0, 0, 1)
        restartPuzzle()


func _square_01_click(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    processSquareClick(1, square01, event)

func _square_02_click(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    processSquareClick(2, square02, event)

func _square_03_click(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    processSquareClick(3, square03, event)

func _square_04_click(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    processSquareClick(4, square04, event)

func processSquareClick(square: int, sprite: Sprite2D, event:InputEvent) -> void:
    if puzzleCompleted:
        return
    if not puzzleActive or not (movingLineIn.turnedOn or movingLineIn.alwaysOn):
        return

    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            sprite.modulate = Color(1, 1, 1, 1)

            var currentSquare: int = buttonSequence[buttonSequenceIndex]
            if square == currentSquare:
                buttonSequenceIndex += 1
                if buttonSequenceIndex >= buttonSequence.size():
                    puzzleCompleted = true
                    turnedOnBackground.modulate = Color(1, 1, 1, 1)
                    movingLineOut.setAlwaysOn()
            else:
                restartPuzzle()

func restartPuzzle() -> void:
    buttonSequenceIndex = 0
    square01.modulate = Color(0, 0, 0, 1)
    square02.modulate = Color(0, 0, 0, 1)
    square03.modulate = Color(0, 0, 0, 1)
    square04.modulate = Color(0, 0, 0, 1)
