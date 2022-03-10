extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _process(delta):
	$Label.text = str(Engine.get_frames_per_second())
