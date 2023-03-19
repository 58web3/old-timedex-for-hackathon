import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:openapi/api.dart';
import 'package:time_dex/global/providers.dart';

import 'api_client_repository.dart';

abstract class UserApiRepository {
  Future<void> addUser(Map<String, String> user);
  Future<User> getUser(String userId);
  Future<void> updateUser(
    String userId, {
    required User user,
  });
  Future<void> updateDelegator(
    String userId, {
    required User user,
  });
}

final userApiRepositoryProvider = Provider<UserApiRepository>(
  UserApiRepositoryImpl.new,
);

class UserApiRepositoryImpl extends UserApiRepository {
  UserApiRepositoryImpl(this.ref) {
    client = ref.watch(apiClientRepository);
    api = UserApi(client);
  }
  final Ref ref;
  late UserApi api;
  late ApiClient client;

  @override
  Future<void> addUser(Map<String, String> user) async {
    try {
      final url = Uri.parse('${client.basePath}/v1/user');
      final headers = {'content-type': 'application/json'};
      final body = json.encode(user);
      final resp = await http.post(url, headers: headers, body: body);
      if (resp.statusCode == 201) {
        return;
      } else {
        throw Exception('addUser response is null');
      }
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<User> getUser(String userId) async {
    try {
      final jwt = await _getJWT();
      final response = await api.getUser(jwt, userId);
      if (response == null) {
        throw Exception('getTeamByTeamId response is null');
      }
      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<void> updateUser(
    String userId, {
    required User user,
  }) async {
    late CommonResponse? response;
    try {
      final jwt = await _getJWT();
      response = await api.updateUser(jwt, userId, user: user);
      if (response == null) {
        throw Exception('updateUser response is null');
      }
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<void> updateDelegator(
    String userId, {
    required User user,
  }) async {
    late CommonResponse? response;
    try {
      final jwt = await _getJWT();
      response = await api.updateDelegator(jwt, userId, user: user);
      if (response == null) {
        throw Exception('updateDelegator response is null');
      }
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
