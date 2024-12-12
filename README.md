### [GodotLicensing](https://github.com/nathanfranke/godot-licensing) by nathanfranke

### Usage

Use the `GodotLicensing` singleton to add custom copyrights and licenses. \
Use the `LicensingInterface` node to show all copyrights and licenses to users.

**Note**: It is recommended to set `display/window/stretch` such that licenses
show on all platforms. For example, set `mode` to `canvas_items` and `aspect` to `stretch`.

**Note**: `LicensingInterface` has a minimum size of `256px` × `256px`.

### Example

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

### Screenshot

![example screenshot](https://raw.githubusercontent.com/nathanfranke/godot-licensing/refs/heads/main/static/example.png)

### License

This is free and unencumbered software released into the public domain. See [LICENSE](https://github.com/nathanfranke/godot-licensing/blob/main/LICENSE) for details.
