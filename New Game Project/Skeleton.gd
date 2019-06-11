extends KinematicBody2D

# Movement speed
const SPEED = 400
var movedir = Vector2(0,0)
var movetimer = 0
var movetimer_max = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	movedir = dir.rand()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement_loop()
	if movetimer > 0:
		movetimer -=1
	if movetimer <= 0 || is_on_wall():
		movetimer = movetimer_max
		movedir = dir.rand()

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))