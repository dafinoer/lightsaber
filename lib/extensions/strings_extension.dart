extension StringExtension on Uri {
  int? idFromPathUrl() {
    if (isAbsolute) {
      final total = this.path.length;
      final path = this.path;
      if (total > 1) {
        return int.tryParse(path[total - 2]);
      } else {
        return int.tryParse(path[total - 1]);
      }
    }
    return null;
  }
}
