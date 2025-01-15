extends Node2D

func _ready():
	# Initial startup actions
	await get_tree().create_timer(3.0).timeout 
	$AnimationPlayer.play("fade")  
	await get_tree().create_timer(2.0).timeout  
	$AnimationPlayer.play_backwards("fade")  
	await get_tree().create_timer(1.0).timeout  
	transition_to_main_menu()  

# Function to transition to the main menu
func transition_to_main_menu():
	await get_tree().create_timer(1.0).timeout  
	go_to_main_menu()

# Function to change the scene to the main menu
func go_to_main_menu():
	get_tree().change_scene_to_file("res://mine/scene/main_menu.tscn")
