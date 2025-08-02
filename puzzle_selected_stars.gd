class_name PuzzleSelectedStars extends Sprite2D

@export var movingLineIn: MovingLine
@export var movingLineOut: MovingLine

@export var stars: Array[SelectedStar] = []

@export var turnedOnBackground: Sprite2D

const TOTAL_WHITE_COUNT: int = 0
var whiteCurrentCount: int = 0
const TOTAL_RED_COUNT: int = 1
var redCurrentCount: int = 0
const TOTAL_GREEN_COUNT: int = 2
var greenCurrentCount: int = 0
const TOTAL_BLUE_COUNT: int = 3
var blueCurrentCount: int = 0

var puzzleActive: bool = false
var puzzleCompleted: bool = false

func _ready() -> void:
    movingLineIn.connect("turnedOnOrOff", OnMovingLineInTurnedOnOrOff)
    modulate = Color(0, 0, 0, 1)  # Set initial transparency
    for star in stars:
        star.connect("toggled", _on_star_toggled)

func _on_star_toggled() -> void:
    if puzzleCompleted:
        return
    if not puzzleActive or not (movingLineIn.turnedOn or movingLineIn.alwaysOn):
        return

    whiteCurrentCount = 0
    redCurrentCount = 0
    greenCurrentCount = 0
    blueCurrentCount = 0

    for star in stars:
        if star.colorIndex == 0:
            whiteCurrentCount += 1
        elif star.colorIndex == 1:
            redCurrentCount += 1
        elif star.colorIndex == 2:
            greenCurrentCount += 1
        elif star.colorIndex == 3:
            blueCurrentCount += 1

    if whiteCurrentCount == TOTAL_WHITE_COUNT and redCurrentCount == TOTAL_RED_COUNT and \
       greenCurrentCount == TOTAL_GREEN_COUNT and blueCurrentCount == TOTAL_BLUE_COUNT:
        puzzleCompleted = true
        for star in stars:
            star.setPuzzleCompleted()
        turnedOnBackground.modulate = Color(1, 1, 1, 1)
        movingLineOut.setAlwaysOn()


func OnMovingLineInTurnedOnOrOff(turnedOn: bool) -> void:
    TogglePuzzleOnOrOff(turnedOn)

func TogglePuzzleOnOrOff(turnedOn: bool) -> void:
    if puzzleCompleted:
        return
    puzzleActive = turnedOn
    if puzzleActive:
        modulate = Color(1, 1, 1, 1)
        for star in stars:
            star.setActive()
    else:
        modulate = Color(0, 0, 0, 1)
        for star in stars:
            star.setInActive()