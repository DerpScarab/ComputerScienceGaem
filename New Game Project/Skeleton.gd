extends KinematicBody2D

# Movement speed
const SPEED = 600
var movedir = Vector2(0,0)
var movetimer = 0
var movetimer_max = 15
signal skeletondead

# Called when the node enters the scene tree for the first time.
func _ready():
	movedir = dir.rand()
	add_to_group("enemies")
	$hitbox.connect("body_entered", self, "death")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement_loop()
	sprite_loop()
	if movetimer > 0:
		movetimer -=1
	if movetimer <= 0 || is_on_wall():
		movetimer = movetimer_max
		movedir = dir.rand()

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	
func sprite_loop():
	$anim.play("default")
	
func death():
	emit_signal("skeletondead")
	queue_free()