import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/component/app_config.dart';
import 'package:lightsaber/data/data_source/remote/people_remote_data_source.dart';
import 'package:lightsaber/data/dto/remote/people_dto.dart';
import 'package:lightsaber/data/dto/remote/remote_server_people_dto.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../test_helpers/json_file.dart';
import 'people_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AppConfig>(),
  MockSpec<http.Client>(),
])
void main() {
  group('People Remote Data Source', () {
    late MockClient mockClient;
    late MockAppConfig mockAppConfig;
    late PeopleRemoteDataSource remoteDataSource;
    late Uri uri;

    setUp(() {
      mockClient = MockClient();
      mockAppConfig = MockAppConfig();
      remoteDataSource = PeopleRemoteDataSource(mockClient, mockAppConfig);
      when(mockAppConfig.baseUrl).thenReturn('swapi.dev');
      uri = Uri.https(mockAppConfig.baseUrl, 'api/people', {'page': '1'});
    });

    test('Test single people', () async {
      uri = Uri.https(mockAppConfig.baseUrl, 'api/people/1');
      when(mockClient.get(uri)).thenAnswer((_) =>
          FileDummy.readJsonFile('people')
              .then((value) => http.Response(value, 200)));
      final result = await remoteDataSource.getPeopleById('1');
      expect(result, isA<PeopleDto>());
      expect(result.homeWorld, 1);
    });

    test('Test groups people', () async {
      when(mockClient.get(uri)).thenAnswer((_) =>
          FileDummy.readJsonFile('peoples')
              .then((value) => http.Response(value, 200)));
      final response = await remoteDataSource.getGroupOfPeople('1');
      expect(response, isA<RemoteServerPeopleDto>());
    });

    tearDownAll(() => resetMockitoState());
  });
}
