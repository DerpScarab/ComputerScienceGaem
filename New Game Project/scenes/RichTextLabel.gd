extends RichTextLabel

# Declare member variables here. Examples:
var dialogue = ["insert dialogue", "e"]
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _input(event):
	# if event.type == InputEvent.MOUSE_BUTTON && event.is_action_pressed():
		# if get_visible_characters() > get_total_character_count():
				# if page < dialogue.size()-1:
					# page += 1
					# set_bbcode(dialogue[page])
					# set_visible_characters(0)
		# else:
			# set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
