final _regexps = <RegExp>[
  RegExp(r'^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11})[^ \n]*$'),
  RegExp(r'^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11})[^ \n]*$')
];

String getIdFromUrl(String url) {
  if (url == null) {
    throw ArgumentError('Url must not be null');
  }

  if (url.isEmpty) {
    return null;
  }

  for (final exp in _regexps) {
    final match = exp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return match.group(1);
    }
  }

  return null;
}
