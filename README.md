# Dart YouTube Parser
A tiny Dart library that extracts YouTube video IDs from all kinds of valid
Youtube urls.

## Usage

```dart
import 'package:youtube_parser/youtube_parser.dart';

String? a = getIdFromUrl('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
// returns 'dQw4w9WgXcQ'

String? b = getIdFromUrl('https://youtu.be/dQw4w9WgXcQ');
// returns 'dQw4w9WgXcQ'

String? c = getIdFromUrl('https://www.some-other-website.com/blog-post');
// returns null
```
