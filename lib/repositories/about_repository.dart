import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/user.dart';
import 'package:plataforma_rede_campo/repositories/parse_errors.dart';

AnsiPen greenPen = AnsiPen()..green();

class AboutRepository {
  Future<List<User>> getAllPesquisadores() async {
    try {
      //especificando que a busca sera na tabela 'User'
      QueryBuilder<ParseUser> queryUsers = QueryBuilder<ParseUser>(ParseUser.forQuery());

      final response = await queryUsers.query();

      if (response.success && response.results != null) {
        //response contem uma lista de ParseUser então precisamos converter essa lista em uma lista de User
        return response.results!.map((e) => User.fromParse(e)).toList();
      } else if (response.success && response.results == null) {
        //se nao encontrar nenum resultado na busca retorna uma lista vazia
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      if (kDebugMode) {
        print(greenPen(e.toString()));
      }
      return Future.error(greenPen('Falha de conexão'));
    }
  }

  Future<List<User>> getAllMembros() async {
    try {
      //especificando que a busca sera na tabela 'User'
      QueryBuilder<ParseUser> queryUsers = QueryBuilder<ParseUser>(ParseUser.forQuery());

      final response = await queryUsers.query();

      if (response.success && response.results != null) {
        //response contem uma lista de ParseUser então precisamos converter essa lista em uma lista de User
        return response.results!.map((e) => User.fromParse(e)).toList();
      } else if (response.success && response.results == null) {
        //se nao encontrar nenum resultado na busca retorna uma lista vazia
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      if (kDebugMode) {
        print(greenPen(e.toString()));
      }
      return Future.error(greenPen('Falha de conexão'));
    }
  }

  Future<List<User>> getAllColaboradores() async {
    try {
      //especificando que a busca sera na tabela 'User'
      QueryBuilder<ParseUser> queryUsers = QueryBuilder<ParseUser>(ParseUser.forQuery());

      final response = await queryUsers.query();

      if (response.success && response.results != null) {
        //response contem uma lista de ParseUser então precisamos converter essa lista em uma lista de User
        return response.results!.map((e) => User.fromParse(e)).toList();
      } else if (response.success && response.results == null) {
        //se nao encontrar nenum resultado na busca retorna uma lista vazia
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      if (kDebugMode) {
        print(greenPen(e.toString()));
      }
      return Future.error(greenPen('Falha de conexão'));
    }
  }
}
