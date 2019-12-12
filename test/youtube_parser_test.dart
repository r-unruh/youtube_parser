import 'package:test/test.dart';

import 'package:youtube_parser/youtube_parser.dart';

const _validId = 'v4lid-YT-id';

final _validLinks = <String>[
  'https://www.youtube.com/watch?v=$_validId',
  'https://www.youtube.com/watch?v=$_validId?t=27m53s',
  'https://www.youtube.com/watch?v=$_validId&list=xS9cRDfFtF9FM#t=0',
  'https://m.youtube.com/watch?v=$_validId',
  'https://m.youtube.com/watch?v=$_validId&list=xS9cRDfFtF9FM#t=0',
  'https://youtu.be/$_validId',
  'https://youtu.be/$_validId?list=RDtF9FxSfF9cM'
];

void main() {
  for (final link in _validLinks) {
    test('Should return ID: $link', () {
      expect(getIdFromUrl(link), equals(_validId));
    });
  }

  test('Throws error on null', () {
    expect(() => getIdFromUrl(null), throwsA(const TypeMatcher<ArgumentError>()));
  });

  test('Should return null for bad url', () {
    final invalidLinks = <String>[
      'foobar',
      'https://www.any-website.com',
      'https://www.notyoutube.com/watch?v=$_validId',
      'https://www.youtube.com/watch?v=CBWlfU_na-',
      'https://n.youtube.com/watch?v=$_validId',
      'https://m.youtube.com/wtch?v=$_validId&list=xS9cRDfFtF9FM#t=0',
      'https://youtu.be/CBWlfU_na-',
      'https://youtu.de/$_validId',
      'https://www.youtu.be/$_validId'
    ];

    // Test for misplaced whitespaces
    for (final link in _validLinks) {
      invalidLinks
          ..add(' $link ')
          ..add(' $link')
          ..add('$link ');
    }

    for (final link in invalidLinks) {
      expect(getIdFromUrl(link), isNull);
    }
  });
}
