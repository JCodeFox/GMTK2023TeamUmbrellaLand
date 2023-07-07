extends CharacterBody2D

var walk_speed: float = 70
var walk_left: bool = false
var gravity: float

func _process(delta):
	gravity = PhysicsServer2D.area_get_param(get_viewport().find_world_2d().space, PhysicsServer2D.AREA_PARAM_GRAVITY)
	if is_on_wall():
		walk_left = get_wall_normal().x < -0.5
		$Sprite.flip_h = walk_left
	if is_on_floor():
		velocity.x = walk_speed * (-1 if walk_left else 1)
	velocity.y += delta * gravity
	move_and_slide()
