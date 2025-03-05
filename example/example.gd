## See [GodotLicensing] for usage.
extends Node


# TODO: Windows currently do not scale properly with certain configurations of
# [code]display/window/stretch[/code]. They appear blurry at high resolutions.
@onready var window: Window = $Window


static func _static_init() -> void:
	GodotLicensing.add_copyright({
		&"name": "Example",
		&"parts": [{
			&"copyright": [
				"2024 Example"
			],
			&"license": "Example",
		}],
	})
	GodotLicensing.add_license({
		&"name": "Example",
		&"text": "Example text",
	})


func _ready() -> void:
	window.hide()


func _on_show_copyrights_pressed() -> void:
	window.popup_centered()


func _on_window_close_requested() -> void:
	window.hide()
