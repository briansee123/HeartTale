extends CharacterBody2D  # Ensure this matches your node type

class_name Aurora  # Optional: Declare class name for custom type

const IDLE_FRAME: int = 1  # Place constants here

onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	_animated_sprite.play("down")
	_animated_sprite.frame = IDLE_FRAME
	_animated_sprite.stop()
