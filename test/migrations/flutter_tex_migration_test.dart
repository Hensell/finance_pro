import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('pubspec uses flutter_tex and no longer includes flutter_math_fork', () {
    final String pubspec = File('pubspec.yaml').readAsStringSync();
    final String lockfile = File('pubspec.lock').readAsStringSync();

    expect(pubspec, contains('flutter_tex:'));
    expect(pubspec, isNot(contains('flutter_math_fork')));
    expect(lockfile, isNot(contains('flutter_math_fork')));
  });

  test('source tree does not reference the old math API', () {
    final List<String> forbiddenPatterns = <String>[
      'flutter_math_fork',
      'package:flutter_math',
      'Math.tex',
      'SelectableMath',
    ];

    final Iterable<File> files = <File>[
      File('pubspec.yaml'),
      File('pubspec.lock'),
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

  test('web bootstrap includes flutter_tex runtime assets', () {
    final String indexHtml = File('web/index.html').readAsStringSync();

    expect(indexHtml, contains('flutter_tex.js'));
    expect(indexHtml, contains('mathjax_core.js'));
  });
}

Iterable<File> _dartFilesIn(String path) sync* {
  final Directory directory = Directory(path);
  if (!directory.existsSync()) {
    return;
  }

  for (final FileSystemEntity entity
      in directory.listSync(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      yield entity;
    }
  }
}
