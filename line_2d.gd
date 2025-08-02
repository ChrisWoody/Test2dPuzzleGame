class_name AnimatedLine2D extends Line2D

# manipulate a Gradient so it looks like its animated
@export var gradient_speed: float = 1.0
@export var gradient_offset: float = 0.0
@export var gradient_offset_speed: float = 0.1
@export var gradient_offset_direction: int = 1 # 1 for right, -1 for left
@export var gradient_offset_max: float = 1.0
@export var gradient_offset_min: float = 0.0
@export var gradient_offset_step: float = 0.5
@export var gradient_offset_step_speed: float = 0.01
func _ready():
    # Initialize the gradient offset
    gradient_offset = gradient_offset_min
    # print number of gradient offsets
    #print("Number of gradient offsets: ", gradient.offsets.size())

func _process(delta: float) -> void:
    # Update the gradient offset based on the speed and direction
    gradient_offset += gradient_offset_direction * gradient_offset_step * delta
    # Clamp the gradient offset to the defined min and max values
    gradient_offset = clamp(gradient_offset, gradient_offset_min, gradient_offset_max)
    print("Gradient offset: ", gradient_offset)
    # Update the gradient with the new offset
    gradient.set_offset(0, gradient_offset)
    gradient.set_offset(1, gradient_offset)