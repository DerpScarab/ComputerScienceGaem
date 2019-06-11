extends Node2D

func _ready():
	add_to_group("weapons")
	connect("body_enter", self, "on_body_enter")
	$anim.connect("animation_finished",self,"destroy")
	$anim.play(str("slash",get_parent().spritedir))

func _on_Area2D_body_entered(body):
	print(body)
	body.get_parent().queue_free()
	queue_free()

func destroy(animation):
	queue_free()
