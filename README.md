# Rekt-Swift
Functional approach to altering CGRect

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Features
- Alter CGRect in a more functional and declarative way
  - Alter everything at once (`x`, `y`, `width`, `height`)
  - Or alter by chaining individual calls for each

## Quick Example

```swift
// Alter x, y, width, and height all at once
// Return a tuple of (x,y,width,height)
let rect = CGRectZero.alter { (x, y, width, height) -> Rekt in
	(x+10,y+5,200,100)
}

// Chain calls for x, y, width, and height together
// Each x, y, width, and height have a function that
// takes a closure and one that takes a value
let rect = CGRectZero.alterX({$0+10})
	.alterY({$0+5})
	.alterWidth(200)
	.alterHeight(100)
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Rekt into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "joshdholtz/Rekt-Swift" "master"
```

Run `carthage` to build the framework and drag the built `Rekt.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Rekt into your project manually by copying and pasting all the files in the `Classes` directory.

## Usage

### Alter All
```swift
let rect = frame.alter { (x, y, width, height) -> Rekt in
	(x+10,y+5,200,100)
}
```

### Alter All (inout)
- Uses inout variables instead of returning tuple
- Don't need to modify all variables
```swift
let rect = frame.alter({ (x, y, width, height) -> Void in
	x += 10
	y += 5
	width = 200
	height = 100
	return
})
```

### Alter Individual By Chaining
```swift
let rect = frame.alterX({$0+10})
	.alterY({$0+5})
	.alterWidth({$0+200})
	.alterHeight({$0+100})
```

### Alter Individual By Value 
```swift
let rect = frame.alterX(10)
	.alterY(5)
	.alterWidth(200)
	.alterHeight(100)
```

## Author

Josh Holtz, me@joshholtz.com, [@joshdholtz](https://twitter.com/joshdholtz)

## License

`Rekt-Swift` is available under the MIT license. See the LICENSE file for more info.
