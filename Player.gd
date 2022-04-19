extends KinematicBody2D

# Declare member variables here. Examples:
var facing = "down"
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var SPEED = 500;
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2(0,-1)
		facing = "up"
	if Input.is_action_pressed("ui_down"):
		velocity += Vector2(0,1)
		facing = "down"
	if Input.is_action_pressed("ui_left"):
		velocity += Vector2(-1, 0)
		facing = "left"
	if Input.is_action_pressed("ui_right"):
		velocity += Vector2(1, 0)
		facing = "right"
		
	velocity = velocity.normalized()
	move_and_slide(velocity*SPEED)
	
	if velocity == Vector2.ZERO:
		$AnimatedSprite.animation = 'idle_'+facing
	else:
		$AnimatedSprite.animation = "walk_"+facing
