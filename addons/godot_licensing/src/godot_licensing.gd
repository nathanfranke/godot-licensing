## [url=https://github.com/nathanfranke/godot-licensing]GodotLicensing[/url] by nathanfranke
##
## Use the [GodotLicensing] class to add custom copyrights and licenses (see below).
## [br]
##
## Use the [LicensingInterface] node to show all copyrights and licenses to users.
## [br][br]
##
## [b]Note[/b]: It is recommended to set [code]display/window/stretch[/code] such that the full interface shows on all resolutions. For example, set [code]mode[/code] to [code]canvas_items[/code] and [code]aspect[/code] to [code]stretch[/code].
## [br][br]
##
## [b]Note[/b]: [LicensingInterface] has a minimum size of [code]256px[/code] × [code]256px[/code].
## [br][br]
##
## Example copyright with license:
##
## [codeblock]
##GodotLicensing.add_copyright({
##    &"name": "Example",
##    &"parts": [{
##        &"copyright": [
##            "2024 Example"
##        ],
##        &"license": "Example",
##    }],
##})
##GodotLicensing.add_license({
##    &"name": "Example",
##    &"text": "Example text",
##})
## [/codeblock]
##
## Example copyright without license:
##
## [codeblock]
##GodotLicensing.add_copyright({
##    &"name": "Example",
##    &"parts": [{
##        &"copyright": [
##            "2024 Example"
##        ],
##    }],
##})
## [/codeblock]
@tool
class_name GodotLicensing


static var _engine_copyrights := Engine.get_copyright_info()
static var _engine_licenses := Engine.get_license_info()
static var _custom_copyrights := []
static var _custom_licenses := {}


static func _static_init() -> void:
	# Some jurisdictions require attribution—even for public domain works.
	# https://wikipedia.org/wiki/Moral_rights
	
	var unlicense := preload("res://addons/godot_licensing/licenses/unlicense-1.0.tres")
	var cc0 := preload("res://addons/godot_licensing/licenses/cc0-1.0.tres")
	
	_engine_copyrights.push_back({
		&"name": "godot-licensing",
		&"parts": [{
			&"copyright": ["2024-2025 nathanfranke"],
			&"license": "Unlicense",
		}]
	})
	_engine_licenses.merge({
		"Unlicense": unlicense.text,
	})
	
	_engine_copyrights.push_back({
		&"name": "Paper SVG Vector",
		&"parts": [{
			&"copyright": ["2025 SVG Repo"],
			&"license": "CC0-1.0",
		}]
	})
	_engine_licenses.merge({
		"CC0-1.0": cc0.text,
	})


## Adds a copyright. [code]license[/code] is optional. See [GodotLicensing] for usage.
static func add_copyright(copyright: Dictionary) -> void:
	assert(copyright.has(&"name"), "Expected key: 'name'.")
	assert(copyright.get(&"parts") is Array, "Expected array key: 'parts'.")
	for part in copyright.parts:
		assert(part is Dictionary, "Expected 'parts' element to be a dictionary.")
		assert(part.get(&"copyright") is Array, "Expected 'parts' element array key: 'copyright'.")
	_custom_copyrights.push_back(copyright)


## Adds a license. See [GodotLicensing] for usage.
static func add_license(license: Dictionary) -> void:
	assert(license.has(&"name"), "Expected key: 'name'.")
	assert(license.has(&"text"), "Expected key: 'text'.")
	assert(license.name not in _engine_licenses, "Overriding engine license '%s' is not allowed." % license.name)
	_custom_licenses[license.name] = license.text


## Returns the full array of copyrights. [b]Not required for standard usage.[/b]
static func get_copyrights() -> Array[Dictionary]:
	var copyrights: Array[Dictionary]
	copyrights.append_array(_custom_copyrights)
	copyrights.append_array(_engine_copyrights)
	return copyrights


## Returns the full array of licenses. [b]Not required for standard usage.[/b]
static func get_licenses() -> Dictionary:
	var licenses := {}
	licenses.merge(_custom_licenses)
	licenses.merge(_engine_licenses)
	return licenses
