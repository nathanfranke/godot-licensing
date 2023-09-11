# <img src="static/nicense.svg" width=24> Nicense - Godot Licensing Made Easy

Licensing is complicated and tedious. This addon adds a preset window dialog and button that can show an interactive list of all engine licenses.

This addon is released into public domain (see [LICENSE](LICENSE)). You may sell or redistribute by any means without attribution.

### Custom licenses example:

```gdscript
func _ready():
	Nicense.add_product(Nicense.Product.new("My Project", [
		Nicense.Copyright.new(
			["2021, Nathan Franke"],
			"My License"
		)
	]))
	Nicense.add_license(Nicense.License.new("My License", "This software shall be used for good, not evil."))
```

### Example screenshot:

![example](static/example.png)
