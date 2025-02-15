extends Node3D

@export var player: Node3D
@export var follow_speed: float = 6.9
@export var catchup_speed: float = 10
@export var max_delay: float = 0.4
@export var ease_in_speed: float = 1

var previous_player_position: Vector3

func _ready():
	if player:
		previous_player_position = player.global_transform.origin 

func _process(delta: float) -> void:
	if not player:
		return

	var player_position = player.global_transform.origin
	var distance = global_transform.origin.distance_to(player_position)

	
	var is_moving = !player_position.is_equal_approx(previous_player_position)

	var speed = follow_speed
	if distance > max_delay:
		speed = catchup_speed
	elif not is_moving:
		speed = ease_in_speed

	global_transform.origin = global_transform.origin.lerp(player_position, speed * delta*4)

	previous_player_position = player_position
