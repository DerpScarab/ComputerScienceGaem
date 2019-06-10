extends KinematicBody2D
class_name base

export(int) var SPEED = 0

var movedir = Vector2(0,0)
var spritedir = "down"

# Called when the node enters the scene tree for the first time.
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))

func sprite_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"

func anim_switch(animation):
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
			$anim.play(newanim)
