# Dart YouTube Parser

## Usage

```
import 'package:youtube_parser/youtube_parser.dart';

String? a = getIdFromUrl('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
// a == 'dQw4w9WgXcQ'

String? b = getIdFromUrl('https://youtu.be/dQw4w9WgXcQ');
// b == 'dQw4w9WgXcQ'

String? c = getIdFromUrl('https://www.anotherwebsite.com/watch?v=dQw4w9WgXcQ');
// c == null
```
