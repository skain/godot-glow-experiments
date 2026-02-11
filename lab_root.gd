extends Node2D

@onready var world_env: WorldEnvironment = $WorldEnvironment
@onready var env: Environment = world_env.environment

func _ready() -> void:
	# Ensure Glow is actually on
	env.glow_enabled = true
	# Set a default blend mode (usually Additive for 2D)
	env.glow_blend_mode = Environment.GLOW_BLEND_MODE_ADDITIVE

func _on_intensity_slider_value_changed(value: float) -> void:
	env.glow_intensity = value

func _on_strength_slider_value_changed(value: float) -> void:
	env.glow_strength = value

func _on_threshold_slider_value_changed(value: float) -> void:
	# Keep in mind: lower threshold = more things glow
	env.glow_hdr_threshold = value
