abstract interface class LocalizedContentRepository<T> {
  Future<T> load({required String localeCode});
}
