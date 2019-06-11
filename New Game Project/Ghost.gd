extends KinematicBody2D

var reached = false
const SPEED = 200
const ROTATION_SPEED = 20

func _process(delta):
	var direction = (Player.get_pos() - Ghost.get_pos()).normalized()
