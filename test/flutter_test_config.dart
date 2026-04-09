import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> testExecutable(FutureOr<void> Function() main) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await loadAppFonts();
  await main();
}
