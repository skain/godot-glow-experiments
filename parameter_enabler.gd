class_name ParameterEnabler extends HBoxContainer

signal check_box_toggled(toggled_on: bool)

@onready var label: Label = %Label
@onready var check_box: CheckBox = $CheckBox
			
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = name
	
func set_button_pressed(pressed:bool) -> void:
	check_box.button_pressed = pressed


func _on_check_box_toggled(toggled_on: bool) -> void:
	check_box_toggled.emit(toggled_on)
