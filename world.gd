class_name World extends Node2D


# label
@export var label: Label
var num := 0

func _on_minus_button_pressed() -> void:
    num -= 1
    label.text = str(num)

func _on_plus_button_pressed() -> void:
    num += 1
    label.text = str(num)

