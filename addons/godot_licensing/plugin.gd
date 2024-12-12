@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("GodotLicensing", "res://addons/godot_licensing/godot_licensing.gd")
	add_custom_type("LicensingInterface", "Control", load("res://addons/godot_licensing/licensing_interface.gd"), load("res://addons/godot_licensing/icons/control.svg"))


func _exit_tree():
	remove_autoload_singleton("GodotLicensing")
	remove_custom_type("LicensingInterface")
