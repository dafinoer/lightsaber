class AppConfig {
  final String baseUrl;

  const AppConfig._({required this.baseUrl});

  factory AppConfig.dev() => const AppConfig._(baseUrl: 'swapi.dev/api');

  factory AppConfig.prod() => const AppConfig._(baseUrl: 'swapi.dev/api');

  factory AppConfig.qa() => const AppConfig._(baseUrl: 'swapi.dev/api');
}
