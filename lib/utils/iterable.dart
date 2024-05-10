extension IterableExtension<T> on Iterable<T>? {
  bool get validate => this != null && this!.isNotEmpty;
}

extension IterableCustomExtension<T> on Iterable<T> {
  List<S> mapIndexed<S>(S Function(int, T) func) => toList()
      .asMap()
      .map((index, value) => MapEntry(index, func(index, value)))
      .values
      .toList();

  List<T> get withoutNulls => where((s) => s != null).map((e) => e!).toList();
}