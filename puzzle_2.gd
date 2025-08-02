class_name Puzzle2 extends Node2D

@onready var label: Label = $Label
@onready var button1: Button = $Button1
@onready var button2: Button = $Button2
@onready var button3: Button = $Button3
@onready var button4: Button = $Button4
@onready var button5: Button = $Button5



func _on_button_toggled(toggled_on:bool) -> void:
    if not toggled_on:
        return

    if not button1.button_pressed:
        button2.button_pressed = false
        button3.button_pressed = false
        button4.button_pressed = false
        button5.button_pressed = false
    elif not button2.button_pressed:
        button3.button_pressed = false
        button4.button_pressed = false
        button5.button_pressed = false
        
    