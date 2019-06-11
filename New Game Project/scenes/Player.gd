extends KinematicBody2D

# Movement speed
const SPEED = 500
var spritedir = "down"
var movedir = Vector2(0,0)
var attack = preload("res://scenes/attack.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	controls_loop()
	spritedir_loop()
	anim_loop()
	movement_loop()

func controls_loop():
	var LEFT   = Input.is_action_pressed("ui_left")
	var RIGHT  = Input.is_action_pressed("ui_right")
	var UP     = Input.is_action_pressed("ui_down")
	var DOWN   = Input.is_action_pressed("ui_up")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(DOWN) + int(UP)
	
	if Input.is_action_just_released("ui_select"):
		var slash = attack.instance()
		add_child(slash)

func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"

func anim_loop():
	if movedir.x == 0 && movedir.y == 0:
		$anim.play("idle")
	else:
		$anim.play("walk")

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Skeletal" || collision.collider.name == "Ghost" || collision.collider.name == "Skeletal" && collision.collider.name == "Ghost":
			get_tree().change_scene("res://scenes/lose.tscn")
