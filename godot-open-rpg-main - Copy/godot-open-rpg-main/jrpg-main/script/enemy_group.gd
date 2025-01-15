extends Node2D

var enemies: Array = []
var action_queue: Array = []
var is_battling: bool = false
var index: int = 0

signal next_player
@onready var choice = $"../CanvasLayer/choice"

func _ready():
	enemies = get_children()
	for i in range(enemies.size()):
		enemies[i].position = Vector2(0, i * 32)
	show_choice()

func _process(_delta):
	if not choice.visible:
		if Input.is_action_just_pressed("ui_up"):
			if index > 0:
				index -= 1
				switch_focus(index, index + 1)

		if Input.is_action_just_pressed("ui_down"):
			if index < enemies.size() - 1:
				index += 1
				switch_focus(index, index - 1)

		if Input.is_action_just_pressed("ui_accept"):
			action_queue.push_back(index)
			emit_signal("next_player")
			show_choice()

	if action_queue.size() == enemies.size() and not is_battling:
		is_battling = true
		_action(action_queue)
		_reset_focus()

func _action(stack):
	for i in stack:
		var enemy = enemies[i]
		var is_dead = enemy.take_damage(1)  # Assume take_damage returns true if HP <= 0
		if is_dead:
			enemy.queue_free()
			enemies.remove_at(i)
			if i <= index and index > 0:
				index -= 1  # Adjust index if necessary
		await get_tree().create_timer(1).timeout
	action_queue.clear()
	is_battling = false
	show_choice()

func switch_focus(x, y):
	enemies[x].focus()
	enemies[y].unfocus()

func show_choice():
	choice.show()
	choice.find_child("Attack").grab_focus()

func _reset_focus():
	index = 0
	for enemy in enemies:
		enemy.unfocus()

func _start_choosing():
	_reset_focus()
	if enemies.size() > 0:
		enemies[0].focus()

func _on_attack_pressed():
	choice.hide()
	_start_choosing()

func _on_run_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _on_next_player() -> void:
	pass # Replace with function body.
