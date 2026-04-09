final class AppRoutePaths {
  static const String onboarding = '/';
  static const String home = '/home';
  static const String feature = '/feature/:featureId';
  static const String topic = '/feature/:featureId/topic/:topicId';
  static const String calculator = '/feature/:featureId/calculator';

  static String featureLocation(String featureId) => '/feature/$featureId';

  static String topicLocation({
    required String featureId,
    required String topicId,
  }) =>
      '/feature/$featureId/topic/$topicId';

  static String calculatorLocation(String featureId) =>
      '/feature/$featureId/calculator';
}
