import 'package:youtube_parser/youtube_parser.dart';

void main() {
  String? videoId = getIdFromUrl('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
  print(videoId); // Valid url, prints 'dQw4w9WgXcQ'

  videoId = getIdFromUrl('https://www.anotherwebsite.com/watch?v=dQw4w9WgXcQ');
  print(videoId); // Not a valid YouTube url, prints null
}
