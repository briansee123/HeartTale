class_name MainMenu
extends Control


@onready var stat_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Stat_Button as Button
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var start_level = preload("res://scene/battle_scene.tscn") as PackedScene


func _ready():
	stat_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_exit_pressed() -> void:
	get_tree().quit()
