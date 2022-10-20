class Group<T> {
  final int count;

  final List<T> result;

  Group(this.count, this.result);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Group &&
        other.count == count &&
        other.result == other.result;
  }

  @override
  int get hashCode => Object.hash(count, result);
}
