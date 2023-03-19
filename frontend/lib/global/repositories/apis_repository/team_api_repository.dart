import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:time_dex/global/providers.dart';

import 'api_client_repository.dart';

abstract class TeamApiRepository {
  Future<void> addTeam({required Team team});
  Future<void> updateTeam(String teamId, {required Team team});
  Future<TeamDetail> getTeamByTeamId(String teamId);
  Future<List<TeamDetail>> getUserTeams();
}

final teamApiRepositoryProvider = Provider<TeamApiRepository>(
  TeamApiRepositoryImpl.new,
);

class TeamApiRepositoryImpl extends TeamApiRepository {
  TeamApiRepositoryImpl(this.ref) {
    final client = ref.watch(apiClientRepository);
    api = TeamApi(client);
  }
  final Ref ref;
  late TeamApi api;

  @override
  Future<void> addTeam({required Team team}) async {
    late CreateTeamResponse? response;
    try {
      final jwt = await _getJWT();
      response = await api.addTeam(jwt, team: team);
      ref.watch(loggerProvider).i(response);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<void> updateTeam(String teamId, {required Team team}) async {
    late CommonResponse? response;
    try {
      final jwt = await _getJWT();
      response = await api.updateTeam(jwt, teamId, team: team);
      ref.watch(loggerProvider).i(response);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<TeamDetail> getTeamByTeamId(String teamId) async {
    try {
      final jwt = await _getJWT();
      final response = await api.getTeamByTeamId(jwt, teamId);
      if (response == null) {
        throw Exception('getTeamByTeamId response is null');
      }
      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<List<TeamDetail>> getUserTeams() async {
    try {
      final jwt = await _getJWT();
      final response = await api.getUserTeams(jwt);
      if (response == null) {
        throw Exception('getUserTeams response is null');
      }
      return response.userTeams;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<String> _getJWT() async {
    final jwt = await ref.watch(secureStorageProvider).read(key: 'jwt');
    if (jwt == null) {
      throw Exception('Access token in not exists');
    }
    return jwt;
  }
}
