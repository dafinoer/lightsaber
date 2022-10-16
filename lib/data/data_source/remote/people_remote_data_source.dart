import 'dart:convert';

import 'package:lightsaber/component/app_config.dart';
import 'package:lightsaber/data/dto/remote/people_dto.dart';
import 'package:http/http.dart' as http;

import '../../dto/remote/remote_server_people_dto.dart';

class PeopleRemoteDataSource {
  PeopleRemoteDataSource(this.client, this.appConfig);

  final http.Client client;
  final AppConfig appConfig;

  Future<RemoteServerPeopleDto> getGroupOfPeople(
      [String pagination = '1']) async {
    final uri = Uri.https(
      appConfig.baseUrl,
      'api/people',
      {'page': pagination},
    );
    final jsonResultFromServer = await client.get(uri);
    final jsonDecodeResult = json.decode(jsonResultFromServer.body);
    final remoteServerResult = RemoteServerPeopleDto.fromJson(jsonDecodeResult);
    return remoteServerResult;
  }

  Future<PeopleDto> getPeopleById(String idPeople) async {
    final uri = Uri.https(appConfig.baseUrl, 'api/people/$idPeople');
    final jsonResultFromServer = await client.get(uri);
    final jsonDecodeResult = json.decode(jsonResultFromServer.body);
    final peopleDto = PeopleDto.fromJson(jsonDecodeResult);
    return peopleDto;
  }
}
