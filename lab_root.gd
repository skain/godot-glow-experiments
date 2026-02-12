extends Node2D

@onready var world_environment: WorldEnvironment = %WorldEnvironment
@onready var sprite_1: Sprite2D = %Sprite1
@onready var sprite_2: Sprite2D = %Sprite2
@onready var sprite_1_self_modulate_h_slider: HSlider = %Sprite1SelfModulateHSlider
@onready var sprite_2_self_modulate_h_slider: HSlider = %Sprite2SelfModulateHSlider
@onready var glow_intensity_h_slider: HSlider = %GlowIntensityHSlider
@onready var glow_strength_h_slider: HSlider = %GlowStrengthHSlider
@onready var bloom_h_slider: HSlider = %BloomHSlider
@onready var hdr_threshold_h_slider: HSlider = %HDRThresholdHSlider

func _ready() -> void:
	_sync_sliders()
	
func _sync_sliders() -> void:
	_on_sprite_1_self_modulate_h_slider_value_changed(sprite_1_self_modulate_h_slider.value)
	_on_sprite_2_self_modulate_h_slider_value_changed(sprite_2_self_modulate_h_slider.value)
	_on_glow_intensity_h_slider_value_changed(glow_intensity_h_slider.value)
	_on_glow_strength_h_slider_value_changed(glow_strength_h_slider.value)
	_on_bloom_h_slider_value_changed(bloom_h_slider.value)
	_on_hdr_threshold_h_slider_value_changed(hdr_threshold_h_slider.value)

func _self_modulate_canvas_item(item: CanvasItem, mult: float) -> void:
	item.self_modulate = Color.WHITE * mult

func _on_sprite_1_self_modulate_h_slider_value_changed(value: float) -> void:
	_self_modulate_canvas_item(sprite_1, value)

func _on_sprite_2_self_modulate_h_slider_value_changed(value: float) -> void:
	_self_modulate_canvas_item(sprite_2, value)

func _on_glow_intensity_h_slider_value_changed(value: float) -> void:
	world_environment.environment.glow_intensity = value

func _on_glow_strength_h_slider_value_changed(value: float) -> void:
	world_environment.environment.glow_strength = value

func _on_bloom_h_slider_value_changed(value: float) -> void:
	world_environment.environment.glow_bloom = value

func _on_hdr_threshold_h_slider_value_changed(value: float) -> void:
	world_environment.environment.glow_hdr_threshold = value
