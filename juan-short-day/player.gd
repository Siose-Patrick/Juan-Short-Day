extends CharacterBody3D

@onready var sprite = $Pivot/AnimatedSprite3D  # Reference to AnimatedSprite3D

var speed = 7.0

func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()

	velocity.x = direction.x * speed

	move_and_slide()

	if direction.x > 0:
		sprite.flip_h = false  # Face Right
	elif direction.x < 0:
		sprite.flip_h = true  # Face Left

	sprite.play("idle") 

#
#extends CharacterBody3D
#
#@onready var path_follow = $"../PathFollow3D"  # Get reference to PathFollow3D
#
#var speed = 14.0
#var progress = 0.0  # Tracks movement along the path
#
#func _physics_process(delta: float) -> void:
	#var direction = 0  # Default direction is stationary
#
	## Move along the path based on X input
	#if Input.is_action_pressed("move_right"):
		#direction = 1
	#if Input.is_action_pressed("move_left"):
		#direction = -1
#
	#if direction != 0:
		#progress += direction * speed * delta  # Adjust movement speed
		#progress = clamp(progress, 0, 1)  # Keep progress within path range
		#path_follow.progress_ratio = progress  # Move player along path
#
	## Flip player based on movement direction
	#if direction != 0:
		#$Pivot.rotation.y = 0 if direction > 0 else PI
