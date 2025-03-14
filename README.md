# <img src="static/godot-licensing.png" width=20> godot-licensing by nathanfranke

[![Godot Asset Library](https://img.shields.io/badge/download-_?label=Godot%20Asset%20Library&color=blue)](https://godotengine.org/asset-library/asset/1079)
[![GitHub Release](https://img.shields.io/github/v/release/nathanfranke/godot-licensing)](https://github.com/nathanfranke/godot-licensing/releases/latest)
[![GitHub Repo stars](https://img.shields.io/github/stars/nathanfranke/godot-licensing?style=flat)](https://github.com/nathanfranke/godot-licensing)
[![GitHub License](https://img.shields.io/github/license/nathanfranke/godot-licensing?color=brightgreen)](https://github.com/nathanfranke/godot-licensing/blob/main/LICENSE)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/nathanfranke/godot-licensing/builds.yml)](https://github.com/nathanfranke/godot-licensing/actions)

Adds a preset interface that shows an interactive list of all licenses. Custom licenses can be added through the GodotLicensing class.

![example screenshot](https://raw.githubusercontent.com/nathanfranke/godot-licensing/refs/heads/main/static/example.png)

## Usage

Use the `GodotLicensing` class to add custom copyrights and licenses (see below). \
Use the `LicensingInterface` node to show all copyrights and licenses to users. \
</x-nul>

## Examples

Example copyright with license:

```gdscript
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
```

Example copyright without license:

```gdscript
GodotLicensing.add_copyright({
	&"name": "Example",
	&"parts": [{
		&"copyright": [
			"2024 Example"
		],
	}],
})
```

## Copyright

This is free and unencumbered software released into the public domain. See [LICENSE](LICENSE) for details.

[Paper SVG Vector](https://www.svgrepo.com/svg/155092/paper) by [SVG Repo](https://www.svgrepo.com/) is licensed under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
