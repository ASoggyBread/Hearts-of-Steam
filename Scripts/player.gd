extends CharacterBody2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D


const speed = 300.0
const jump_velocity = -400.0

func animate(velX:int,velY:int):
	if velX != 0:
		if velX > 0:
			sprite.scale = Vector2(1,1)
		else:
			sprite.scale = Vector2(-1,1)
		if not anim_player.is_playing():
			anim_player.play("walking")
	else:
		anim_player.play("RESET")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	animate(velocity.x,velocity.y)

	move_and_slide()
