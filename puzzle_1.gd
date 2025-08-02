class_name Puzzle1 extends Node2D

# label to update with the same name
@onready var label: Label = $Label

var toggledOnStars: int = 0

func _on_stars_toggled(toggled_on:bool) -> void:
    # Increment the count of toggled stars
    if toggled_on:
        toggledOnStars += 1
    else:
        toggledOnStars -= 1

    # Check if all stars are toggled on
    if toggledOnStars == 5:
        label.text = "Secret: 1234"
