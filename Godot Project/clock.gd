extends AnimatedSprite2D

### Controls how fast the sprite bobs up and down

@export var float_speed: float = 2.0

### Controls how far the sprite moves from its starting point

@export var float_amplitude: float = 10.0

### Track total elapsed time

var time_passed: float = 0.0

### Store the initial position of the sprite

@onready var start_y: float = position.y

func _process(delta: float) -> void:

### Accumulate time over frames

	time_passed += delta * float_speed

### Calculate the new Y position using a sine wave

	position.y = start_y + sin(time_passed) * float_amplitude
