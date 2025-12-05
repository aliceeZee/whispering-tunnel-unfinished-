extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -250.0

#get gravity from prject
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 

@onready var flashlight=$flashlight2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

#left and right movement
	var direction := Input.get_axis("move_left", "move_right")
	
	#flip the character 
	if direction > 0:
		flashlight.position = Vector2(31, -18)
		flashlight.rotation=0
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		flashlight.position = Vector2(-31, -18)
		flashlight.rotation=deg_to_rad(180)
		animated_sprite_2d.flip_h = true
	
	
	#play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("walk")  
	else:
		animated_sprite_2d.play("jump")
	
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
