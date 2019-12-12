# Dart YouTube Parser

## Usage

```
import 'package:youtube_parser/youtube_parser.dart';

String foo = getIdFromUrl('https://www.youtube.com/watch?v=CBWlfU_na-2');
// returns 'CBWlfU_na-2'

String bar = getIdFromUrl('https://www.notyoutube.com/watch?v=CBWlfU_na-2');
// returns null
```
