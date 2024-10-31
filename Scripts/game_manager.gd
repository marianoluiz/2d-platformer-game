extends Node

# Variable to track the current level, if needed
var current_level = null

func load_level(level_name):
	# Check if there's already a loaded level
	if current_level:
		current_level.queue_free()  # Remove it from the scene
	
	# Load the level scene dynamically
	var level_scene = load("res://Scenes/Levels/" + level_name + ".tscn")
	current_level = level_scene.instance()  # Create an instance of the level
	add_child(current_level)  # Add it to the current scene
	print("Loaded level:", level_name)
