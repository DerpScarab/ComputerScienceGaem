extends RichTextLabel

# Declare member variables here. Examples:
var dialogue = ["Welcome! Press the Space Bar to Attack and advance to the next text box.", "Use the Arrow Keys to move. Press the Space Bar to advance to the game."]
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("ui_select"):
		if get_visible_characters() > get_total_character_count():
				if page < dialogue.size()-1:
					page += 1
					set_bbcode(dialogue[page])
					set_visible_characters(0)
				else:
					get_tree().change_scene("res://TestRoom1.tscn")
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
