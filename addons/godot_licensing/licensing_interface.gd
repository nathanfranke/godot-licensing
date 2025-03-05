## See [GodotLicensing] for usage.
@tool
@icon("res://addons/godot_licensing/icons/control.svg")
class_name LicensingInterface
extends Control


var _copyrights_container := TabContainer.new()
var _licenses_container := TabContainer.new()


# TODO: Avoid hard-coding this. See: https://github.com/godotengine/godot-proposals/issues/7593
func _get_minimum_size() -> Vector2:
	return Vector2(400.0, 400.0)


func _ready() -> void:
	# Wait for parent nodes to populate custom copyrights and licenses on _ready.
	_post_ready.call_deferred()


func _post_ready() -> void:
	var tab_container := TabContainer.new()
	tab_container.add_child(_copyrights_container)
	tab_container.add_child(_licenses_container)
	tab_container.set_tab_title(0, "Copyrights")
	tab_container.set_tab_title(1, "Licenses")
	add_child(tab_container)
	tab_container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	var copyrights := GodotLicensing.get_copyrights()
	for c in copyrights:
		var label := RichTextLabel.new()
		label.text = "%s" % c.name
		for part: Dictionary in c.parts:
			label.text += "\n"
			for author in part.copyright:
				label.text += "\nCopyright \u00a9 %s" % author
			if part.has(&"license"):
				label.text += "\nLicense: %s" % [part.license]
		_copyrights_container.add_child(label)
		_copyrights_container.set_tab_title(_copyrights_container.get_tab_count() - 1, c.name)
	
	var licenses := GodotLicensing.get_licenses()
	for l in licenses:
		var text: String = licenses[l]
		var label := RichTextLabel.new()
		label.text = "%s\n\n%s" % [l, text]
		_licenses_container.add_child(label)
		_licenses_container.set_tab_title(_licenses_container.get_tab_count() - 1, l)
