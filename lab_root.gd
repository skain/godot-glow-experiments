extends Node2D

@onready var world_env: WorldEnvironment = $WorldEnvironment
@onready var env: Environment = world_env.environment

# Add this to your _ready() function in lab_root.gd
func _ready() -> void:
	env.glow_enabled = true
	env.glow_blend_mode = Environment.GLOW_BLEND_MODE_ADDITIVE

	# "Overdrive" the color so it exceeds the default 1.0 threshold
	$GameWorld/GlowingSprite2D.self_modulate = Color(1.5, 1.5, 5.0) # Very blue glow

func _on_intensity_slider_value_changed(value: float) -> void:
	env.glow_intensity = value

func _on_strength_slider_value_changed(value: float) -> void:
	env.glow_strength = value

func _on_threshold_slider_value_changed(value: float) -> void:
	# Keep in mind: lower threshold = more things glow
	env.glow_hdr_threshold = value
