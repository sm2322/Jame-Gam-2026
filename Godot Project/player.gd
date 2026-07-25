extends CharacterBody2D

const MOVE_SPEED := 100.0
const CAMERA_SMOOTHNESS := 0.1

func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * MOVE_SPEED
	move_and_slide()

	if input_dir != Vector2.ZERO:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.flip_h = input_dir.x > 0
	else:
		$AnimatedSprite2D.stop()

	var camera: Camera2D = get_parent().get_node_or_null("Camera2D")
	#if camera != null:
		#camera.global_position = camera.global_position.lerp(global_position, CAMERA_SMOOTHNESS)
