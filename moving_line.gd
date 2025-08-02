class_name MovingLine extends Line2D

@export var alwaysOn := false
@export var turnedOn := false
@export var directionToggle := false
signal turnedOnOrOff(turnedOn: bool)
signal alwaysOnOrOff(alwaysOn: bool)

var scroll : float = 0.0

func setTurnedOn(value: bool) -> void:
    turnedOn = value
    emit_signal("turnedOnOrOff", turnedOn)

func setAlwaysOn() -> void:
    alwaysOn = true
    emit_signal("alwaysOnOrOff", alwaysOn)

func _ready() -> void:
    texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED

    var shader = Shader.new()
    shader.code = """
        shader_type canvas_item;
        uniform float u_offset = 0.0;
        void fragment() {
            vec2 uv = UV;
            uv.x += u_offset;
            COLOR = texture(TEXTURE, uv);
        }
    """
    var shader_material = ShaderMaterial.new()
    shader_material.shader = shader
    self.material = shader_material

func _process(delta: float) -> void:
    if turnedOn or alwaysOn:
        scroll += delta * 2 * (1.0 if directionToggle else -1.0)
        if scroll > 1.0:
            scroll = 0.0
        material.set_shader_parameter("u_offset", scroll)