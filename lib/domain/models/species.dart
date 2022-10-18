class Species {
  final String name;
  final String classification;
  final int averageHeight;
  final String? homeWorldId;
  final List<String>? peopleIds;
  final int? lifeSpan;
  final String? skinColors;
  final String? hairColors;
  final String? eyeColors;

  const Species(
    this.name,
    this.averageHeight,
    this.classification, {
    this.homeWorldId,
    this.peopleIds,
    this.lifeSpan,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Species &&
        other.name == name &&
        other.classification == classification &&
        other.averageHeight == averageHeight &&
        other.homeWorldId == homeWorldId;
  }

  @override
  int get hashCode => Object.hashAll([
        name,
        classification,
        averageHeight,
        homeWorldId,
      ]);
}
