extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@export var leg_programme:Programme

var max_health = 100
var health = max_health

var max_speed = 300.0
var speed = max_speed
var max_jump_speed = -400.0
var jump_speed = max_jump_speed

func animate(velX:int,velY:int):
	if velX != 0:
		if velX > 0:
			anim.scale = Vector2(1,1)
		else:
			anim.scale = Vector2(-1,1)
		if not anim.is_playing():
			anim.play("walk")
	else:
		anim.stop()
func get_input():
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	
	#Handle Movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func _ready() -> void:
	if leg_programme:
		var stats = leg_programme.stats
		for stat in leg_programme.stats:
			pass

	health = max_health
	speed = max_speed
	jump_speed = max_jump_speed
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	get_input()
	
	animate(velocity.x,velocity.y)

	move_and_slide()
