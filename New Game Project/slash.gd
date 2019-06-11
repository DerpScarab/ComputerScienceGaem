extends Node2D

func _ready():
	connect("body_enter", self, "on_body_enter")
	$anim.connect("animation_finished",self,"destroy")
	$anim.play(str("slash",get_parent().spritedir))
	
func destroy(animation):
	queue_free()
