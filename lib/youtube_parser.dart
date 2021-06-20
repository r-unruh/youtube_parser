/// Gets the video ID from any valid YouTube video link.
///
/// Returns null if the video link is not valid.
///
/// Example:
/// ```
/// getIdFromUrl('https://www.youtube.com/watch?v=5KlnlCq2M5Q') -> '5KlnlCq2M5Q'
/// ```
String? getIdFromUrl(String url) {
  if (url.contains(' ')) {
    return null;
  }

  late final Uri uri;
  try {
    uri = Uri.parse(url);
  } catch(e) {
    return null;
  }

  if (!['https', 'http'].contains(uri.scheme)) {
    return null;
  }

  // youtube.com/watch?v=xxxxxxxxxxx
  if (['youtube.com', 'www.youtube.com', 'm.youtube.com'].contains(uri.host)
      && uri.pathSegments.isNotEmpty
      && uri.pathSegments.first == 'watch'
      && uri.queryParameters.containsKey('v')) {
    final videoId = uri.queryParameters['v']!;
    return _isValidId(videoId) ? videoId : null;
  }

  // youtu.be/xxxxxxxxxxx
  if (uri.host == 'youtu.be' && uri.pathSegments.isNotEmpty) {
    final videoId = uri.pathSegments.first;
    return _isValidId(videoId) ? videoId : null;
  }

  return null;
}

bool _isValidId(String id) => RegExp(r'^[_\-a-zA-Z0-9]{11}$').hasMatch(id);
