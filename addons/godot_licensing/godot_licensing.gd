## [url=https://github.com/nathanfranke/godot-licensing]GodotLicensing[/url] by
## nathanfranke
##
## Use the [GodotLicensing] singleton to add custom copyrights and licenses.[br]
## Use the [LicensingInterface] node to show all copyrights and licenses to
## users.
## [br][br]
##
## [b]Note[/b]: It is recommended to set [code]display/window/stretch[/code]
## such that licenses show on all platforms. For example, set [code]mode[/code]
## to [code]canvas_items[/code] and [code]aspect[/code] to [code]stretch[/code].
## [br][br]
##
## [b]Note[/b]: [LicensingInterface] has a minimum size of
## [code]256px[/code] × [code]256px[/code].
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
extends Node


var _engine_copyrights := Engine.get_copyright_info()
var _engine_licenses := Engine.get_license_info()
var _custom_copyrights := []
var _custom_licenses := {}


## Adds a copyright. [code]license[/code] is optional. See [GodotLicensing] for
## usage.
func add_copyright(copyright: Dictionary) -> void:
	assert(copyright.has(&"name"), "Expected key: 'name'.")
	assert(copyright.get(&"parts") is Array, "Expected array key: 'parts'.")
	for part in copyright.parts:
		assert(part is Dictionary, "Expected 'parts' element to be a dictionary.")
		assert(part.get(&"copyright") is Array, "Expected 'parts' element array key: 'copyright'.")
	_custom_copyrights.push_back(copyright)


## Adds a license. See [GodotLicensing] for usage.
func add_license(license: Dictionary) -> void:
	assert(license.has(&"name"), "Expected key: 'name'.")
	assert(license.has(&"text"), "Expected key: 'text'.")
	assert(license.name not in _engine_licenses, "Overriding engine license '%s' is not allowed." % license.name)
	_custom_licenses[license.name] = license.text


## Returns the full array of copyrights. [b]Not required for standard usage.[/b]
func get_copyrights() -> Array[Dictionary]:
	var copyrights: Array[Dictionary]
	copyrights.append_array(_custom_copyrights)
	copyrights.append_array(_engine_copyrights)
	return copyrights


## Returns the full array of licenses. [b]Not required for standard usage.[/b]
func get_licenses() -> Dictionary:
	var licenses := {}
	licenses.merge(_custom_licenses)
	licenses.merge(_engine_licenses)
	return licenses
