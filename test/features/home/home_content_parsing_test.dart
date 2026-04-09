import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/features/home/domain/entities/home_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Home content JSON parses into typed model', () async {
    final String raw = await File('assets/content/es/home.json').readAsString();
    final HomeContent content =
        HomeContent.fromJson(json.decode(raw) as Map<String, dynamic>);

    expect(content.modules, isNotEmpty);
    expect(content.modules.first.id, 'bonds');
  });
}
