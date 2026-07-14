import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('pubspec uses flutter_math_fork and no longer includes flutter_tex', () {
    final String pubspec = File('pubspec.yaml').readAsStringSync();

    expect(pubspec, contains('flutter_math_fork:'));
    expect(pubspec, isNot(contains('flutter_tex:')));
  });

  test('source tree does not reference the old flutter_tex API', () {
    final List<String> forbiddenPatterns = <String>[
      'flutter_tex',
      'package:flutter_tex',
      'TeXWidget',
      'TeXRenderingServer',
    ];

    final Iterable<File> files = <File>[
      File('pubspec.yaml'),
      ..._dartFilesIn('lib'),
      ..._dartFilesIn('test').where(
        (File file) => !file.path.endsWith('flutter_tex_migration_test.dart'),
      ),
    ];

    for (final File file in files) {
      final String content = file.readAsStringSync();
      for (final String pattern in forbiddenPatterns) {
        expect(
          content,
          isNot(contains(pattern)),
          reason: '${file.path} still contains "$pattern".',
        );
      }
    }
  });

  test('web bootstrap does not include flutter_tex runtime assets', () {
    final String indexHtml = File('web/index.html').readAsStringSync();

    expect(indexHtml, isNot(contains('flutter_tex.js')));
    expect(indexHtml, isNot(contains('mathjax_core.js')));
  });
}

Iterable<File> _dartFilesIn(String path) sync* {
  final Directory directory = Directory(path);
  if (!directory.existsSync()) {
    return;
  }

  for (final FileSystemEntity entity in directory.listSync(
    recursive: true,
    followLinks: false,
  )) {
    if (entity is File && entity.path.endsWith('.dart')) {
      yield entity;
    }
  }
}
