extends Node2D

@onready var world_environment: WorldEnvironment = %WorldEnvironment
@onready var sprite_1: Sprite2D = %Sprite1
@onready var sprite_2: Sprite2D = %Sprite2

func _self_modulate_canvas_item(item: CanvasItem, mult: float) -> void:
	if item:
		item.self_modulate = Color.WHITE * mult

func _on_sprite_1_self_modulate_value_changed(value: float) -> void:
	_self_modulate_canvas_item(sprite_1, value)


func _on_sprite_2_self_modulate_value_changed(value: float) -> void:
	_self_modulate_canvas_item(sprite_2, value)


func _on_glow_intensity_value_changed(value: float) -> void:
	world_environment.environment.glow_intensity = value


func _on_glow_strength_value_changed(value: float) -> void:
	world_environment.environment.glow_strength = value


func _on_bloom_value_changed(value: float) -> void:
	world_environment.environment.glow_bloom = value


func _on_hdr_threshold_value_changed(value: float) -> void:
	world_environment.environment.glow_hdr_threshold = value
