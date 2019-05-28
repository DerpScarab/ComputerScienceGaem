extends KinematicBody2D

# Declare member variables here. Examples:
const SPEED = 70
var movedir = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	controls_loop()
	movement_loop()

func controls_loop():
	var LEFT  = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP    = Input.is_action_pressed("ui_up")
	var DOWN  = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(DOWN) + int(UP)

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
