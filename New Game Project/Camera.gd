extends Camera2D
var enemiesdead = 0

var skeleton = preload("res://Enemy_1.tscn")
var enemy1 = skeleton.instance()
var spirit = preload("res://Tutorial_Spirit.tscn")
var enemy2 = spirit.instance()


# Called when the node enters the scene tree for the first time.
func _ready():
	enemy1.position = Vector2(rand_range(-600,600),rand_range(-600,600))
	add_child(enemy1)
	enemy2.position = Vector2(rand_range(-600,600),rand_range(-600,600))
	add_child(enemy2)

func _on_Skeleton_dead():
	enemiesdead +=1
	
func _on_Spirit_dead():
	enemiesdead +=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemiesdead == 2:
		get_tree().change_scene("res://scenes/win.tscn")
