extends Node2D

@onready var world_environment: WorldEnvironment = %WorldEnvironment
@onready var sprite_1: Sprite2D = %Sprite1
@onready var sprite_2: Sprite2D = %Sprite2
@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var sprite_1_self_modulate: ParameterEditor = %Sprite1SelfModulate
@onready var sprite_2_self_modulate: ParameterEditor = %Sprite2SelfModulate
@onready var glow_intensity: ParameterEditor = %GlowIntensity
@onready var glow_strength: ParameterEditor = %GlowStrength
@onready var bloom: ParameterEditor = %Bloom
@onready var hdr_threshold: ParameterEditor = %"HDR Threshold"
@onready var canvas_modulate_enabled: ParameterEnabler = %CanvasModulateEnabled
@onready var canvas_modulate_value: ParameterEditor = %CanvasModulateValue
@onready var canvas_modulate_alpha: ParameterEditor = %CanvasModulateAlpha

func _ready() -> void:
	sprite_1_self_modulate.set_value(sprite_1.self_modulate.r)
	sprite_1_self_modulate.set_value(sprite_1.self_modulate.r)
	sprite_2_self_modulate.set_value(sprite_2.self_modulate.r)
	var env := world_environment.environment
	glow_intensity.set_value(env.glow_intensity)
	glow_strength.set_value(env.glow_strength)
	bloom.set_value(env.glow_bloom)
	hdr_threshold.set_value(env.glow_hdr_threshold)
	canvas_modulate_enabled.set_button_pressed(canvas_modulate.visible)
	canvas_modulate_value.set_value(canvas_modulate.color.v)
	canvas_modulate_alpha.set_value(canvas_modulate.color.a)
	

func _self_modulate_canvas_item(item: CanvasItem, mult: float) -> void:
	print("sprite_1 is: ", sprite_1)
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


func _on_canvas_mod_value_value_changed(value: float) -> void:
	print("current mod value: ", canvas_modulate.color.v)
	print("new mod value: ", value)
	var cur := canvas_modulate.color
	canvas_modulate.color = Color.from_hsv(cur.h, cur.s, value, cur.a)


func _on_canvas_mod_alpha_value_changed(value: float) -> void:	
	print("current alpha value: ", canvas_modulate.color.a)
	print("new alpha value: ", value)
	var cur := canvas_modulate.color
	canvas_modulate.color = Color.from_hsv(cur.h, cur.s, cur.v, value)


func _on_canvas_modulate_enabled_check_box_toggled(toggled_on: bool) -> void:
	canvas_modulate.visible = toggled_on


func _on_canvas_modulate_value_value_changed(value: float) -> void:
	canvas_modulate.color.v = value


func _on_canvas_modulate_alpha_value_changed(value: float) -> void:
	canvas_modulate.color.a = value
