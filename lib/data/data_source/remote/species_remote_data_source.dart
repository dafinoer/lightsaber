import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lightsaber/component/app_config.dart';
import 'package:lightsaber/component/injector.dart';

import '../../dto/remote/remote_server_species_dto.dart';
import '../../dto/remote/type_dto.dart';

class SpeciesRemoteDataSource {
  final http.Client _client;
  final AppConfig _appConfig;

  SpeciesRemoteDataSource(this._client, this._appConfig);

  factory SpeciesRemoteDataSource.create() => SpeciesRemoteDataSource(
        getIt.get(),
        getIt.get(),
      );

  Future<RemoteServerSpeciesDto> getGroupsOfPeople(
      [String pagination = '1']) async {
    final uri =
        Uri.https(_appConfig.baseUrl, 'api/species', {'page': pagination});
    final result = await _client.get(uri);
    final jsonDecode = json.decode(result.body);
    final remoteServerSpecies = RemoteServerSpeciesDto.fromJson(jsonDecode);
    return remoteServerSpecies;
  }

  Future<TypeDto> getSpecies(String id) async {
    final uri = Uri.https(_appConfig.baseUrl, 'api/species/$id');
    final result = await _client.get(uri);
    final jsonDecode = json.decode(result.body);
    final species = TypeDto.fromJson(jsonDecode);
    return species;
  }
}
