import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/component/app_config.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'species_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<http.Client>(),
  MockSpec<AppConfig>(),
])
void main() {
  group('Species Remote Data Source', () {
    late MockClient mockClient;
    late MockAppConfig mockAppConfig;

    setUp(() {
      mockClient = MockClient();
      mockAppConfig = MockAppConfig();
    });

    test('Test get group of species', () {});

    test('Test single species', () {});

    tearDownAll(() {
      resetMockitoState();
    });
  });
}
