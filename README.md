# faabul_color_conversion

faabul_color_conversion is used by [Faabul Color Picker][faabul_color_picker_link] package  and developed by [Faabul Live Quizzes][faabul_link].

## Getting Started

To convert `Color` to `String`, call `asWebColor()` on the `Color` object:

```dart
final color = Colors.teal;
final hex = color.asWebColor();
```

To parse a `String` to `Color`, call `parseAsColor()` on the `String` object:

```dart
final color = '#8D3B72'.parseAsColor();
```

String can be either RRGGBB or AARRGGBB format, case insensitive.

`parseAsColor()` method will throw `FormatException` if the string is not a valid color. 
For convenience, you can use `tryParseAsColor()` method instead, which will return `null` if the string is not a valid color:

```dart
final color = '#INVALID'.tryParseAsColor(); // null
```

[faabul_link]: https://faabul.com
[faabul_color_picker_link]: https://pub.dev/packages/faabul_color_picker