/// Gets the video ID from any valid YouTube video link.
///
/// Returns null if the video link is not valid.
///
/// Example:
/// ```
/// String getIdFromurl('https://www.youtube.com/watch?v=5KlnlCq2M5Q');
/// // returns '5KlnlCq2M5Q'
/// ```
String getIdFromUrl(String url) {
  if (url == null) {
    throw ArgumentError('Url must not be null');
  }

  if (url.isEmpty || url.contains(' ')) {
    return null;
  }

  final uri = Uri.tryParse(url);
  if (uri == null) {
    return null;
  }

  if (!['https', 'http'].contains(uri.scheme)) {
    return null;
  }

  String videoId;

  // youtube.com/watch?v=xxxxxxxxxxx
  try {
    if (['youtube.com', 'www.youtube.com', 'm.youtube.com'].contains(uri.host)
        && uri.pathSegments.first == 'watch') {
      videoId = uri.queryParameters['v'];
    }
  } catch(e) {
    return null;
  }

  // youtu.be/xxxxxxxxxxx
  try {
    if (uri.host == 'youtu.be') {
      videoId = uri.pathSegments.first;
    }
  } catch(e) {
    return null;
  }

  return videoId != null && RegExp(r'^[_\-a-zA-Z0-9]{11}$').hasMatch(videoId)
      ? videoId
      : null;
}
