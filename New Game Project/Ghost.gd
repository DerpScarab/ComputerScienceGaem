extends KinematicBody2D

var reached = false
const SPEED = 200
const ROTATION_SPEED = 20

func _process(delta):
	var ang = get_angle_to(get_node("res://Player.tscn").get_pos())
	rotate(ang*ROTATION_SPEED*delta)
	var x = get_position("res://Player.tscn")
	var y = -sin(ang)
	move_and_slide(Vector2(x*SPEED,y*SPEED))