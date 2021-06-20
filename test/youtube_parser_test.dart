import 'package:test/test.dart';

import 'package:youtube_parser/youtube_parser.dart';

const _validId = 'v4lid-YT_id';

final _validLinks = <String>[
  'https://www.youtube.com/watch?v=$_validId',
  'https://www.youtube.com/watch?v=$_validId&t=27m53s',
  'https://www.youtube.com/watch?v=$_validId&list=xS9cRDfFtF9FM#t=0',
  'https://m.youtube.com/watch?v=$_validId',
  'https://m.youtube.com/watch?v=$_validId&list=xS9cRDfFtF9FM#t=0',
  'https://youtu.be/$_validId',
  'https://youtu.be/$_validId?list=RDtF9FxSfF9cM'
];

void main() {
  // Add some variations
  final additionalValidLinks = <String>[];
  for (final link in _validLinks) {
    additionalValidLinks.add(link.replaceAll('https://', 'http://'));
  }
  _validLinks.addAll(additionalValidLinks);

  for (final link in _validLinks) {
    test('Should return ID: $link', () {
      expect(getIdFromUrl(link), equals(_validId));
    });
  }

  final invalidLinks = <String>[
      '', ' ', '\n',
      'foobar',
      'https://www.any-website.com',
      'https://www.notyoutube.com/watch?v=$_validId',
      'https://www.notyoutube.com/$_validId',
      'https://youtu.be',
      'https://youtube.com',
      'https://m.youtube.com',
      'https://www.youtube.com',
      'https://www.youtube.com/watch',
      'https://www.youtube.com/watch?v=',
      'https://n.youtube.com/watch?v=$_validId',
      'https://m.youtube.com/wtch?v=$_validId&list=xS9cRDfFtF9FM#t=0',
      'https://www.youtu.be/$_validId '
    ];

  // Add some more invalid links to test
  for (final link in _validLinks) {
    invalidLinks

      // Add whitespaces
      ..add(' $link ')
      ..add(' $link')
      ..add('$link ')

      // Add invalid ids
      ..add(link.replaceAll(_validId, 't00-_short'))
      ..add(link.replaceAll(_validId, 't000-_Looong'))
      ..add(link.replaceAll(_validId, 'w1tha sp4c3'))
      ..add(link.replaceAll(_validId, 'inva!id.chr'))

      // Add invalid schemes
      ..add(link.replaceAll(RegExp(r'http[s]*:\/\/'), ''))
      ..add(link.replaceAll(RegExp(r'http[s]*:\/\/'), 'ftp://'))
      ..add(link.replaceAll(RegExp(r'http[s]*:\/\/'), 'htpts://'))
      ..add(link.replaceAll(RegExp(r'http[s]*:\/\/'), 'https:/'));
  }

  // Run tests
  for (final link in invalidLinks) {
    test('Should return null: $link', () {
      expect(getIdFromUrl(link), isNull);
    });
  }
}
