import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/component/app_config.dart';
import 'package:lightsaber/data/data_source/remote/species_remote_data_source.dart';
import 'package:lightsaber/data/dto/remote/remote_server_species_dto.dart';
import 'package:lightsaber/data/dto/remote/type_dto.dart';
import 'package:lightsaber/domain/models/group.dart';
import 'package:lightsaber/domain/models/species.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../test_helpers/json_file.dart';
import 'species_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<http.Client>(),
  MockSpec<AppConfig>(),
])
void main() {
  group('Species Remote Data Source', () {
    late MockClient mockClient;
    late MockAppConfig mockAppConfig;
    late SpeciesRemoteDataSource speciesRemoteDataSource;

    setUp(() {
      mockClient = MockClient();
      mockAppConfig = MockAppConfig();
      speciesRemoteDataSource = SpeciesRemoteDataSource(
        mockClient,
        mockAppConfig,
      );
      when(mockAppConfig.baseUrl).thenReturn('xample.com');
    });

    test('Test get group of species', () async {
      final uri =
          Uri.https(mockAppConfig.baseUrl, 'api/species', {'page': '1'});
      when(mockClient.get(uri)).thenAnswer((realInvocation) =>
          FileDummy.readJsonFile('species_group')
              .then((value) => http.Response(value, 200)));
      final response = await speciesRemoteDataSource.getGroupsOfPeople();
      expect(response, isA<RemoteServerSpeciesDto>());
      expect(response.toEntity(), isA<Group<Species>>());
    });

    test('Test single species', () {
      final uri = Uri.https(mockAppConfig.baseUrl, 'api/species/1');
      when(mockClient.get(uri)).thenAnswer((realInvocation) =>
          FileDummy.readJsonFile('species')
              .then((value) => http.Response(value, 200)));
      expectLater(
          speciesRemoteDataSource.getSpecies('1'), isA<Future<TypeDto>>());
    });

    tearDownAll(() {
      resetMockitoState();
    });
  });
}
