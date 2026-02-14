class_name ParameterEditor extends VBoxContainer
signal value_changed(value: float)

@onready var label: Label = %Label
@onready var h_slider: HSlider = %HSlider
@onready var value_label: Label = %ValueLabel

#@export var label_text := "Label"
@export var min_value := 0.0
@export var max_value := 100.0
@export var step := 1.0
#@export var value := 1.0

func _ready() -> void:
	h_slider.min_value = min_value
	h_slider.max_value = max_value
	h_slider.step = step
	#h_slider.set_value_no_signal(value)
	label.text = name
	value_label.text = str(h_slider.value)
	#call_deferred("emit_signal", "value_changed", h_slider.value)

func set_value(val:float) -> void:
	h_slider.value = val

func _on_h_slider_value_changed(new_value: float) -> void:
	#value = new_value
	value_label.text = str(h_slider.value)
	value_changed.emit(h_slider.value)
