import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/repositories/parse_errors.dart';
import 'package:plataforma_rede_campo/repositories/table_keys.dart';
import '../models/news.dart';

class NewsRepository {
  Future<List<News>> getAllNews() async {
    try {
      //especificando que a busca sera na tabela 'keyNewsTable'
      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyNewsTable));

      //dizemos para trazer na busca todos os dados do Field
      queryBuilder.includeObject([keyNewsField]);

      //ordena pela data de criacao 'do mais novo para o mais velho'
      queryBuilder.orderByDescending(keyNewsCreatedAt);

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        //response contem uma lista de ParseObject então precisamos converter essa lista em uma lista de News
        return response.results!.map((e) => News.fromParse(e)).toList();
      } else if (response.success && response.results == null) {
        //se nao encontrar nenum resultado na busca retorna uma lista vazia
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha de conexão');
    }
  }

  Future<void> saveNews(News news) async {
    try {
      //cria um objeto (registro da tabela News')
      final newsObject = ParseObject(keyNewsTable);

      //verifica se esta sendo editado uma news
      if (news.id != null) {
        newsObject.objectId = news.id;
      }

      //definir as permissões deste objeto(tabela)
      /*final parseAcl = ParseACL(owner: parseUser);
    parseAcl.setPublicReadAccess(allowed: true);
    parseAcl.setPublicWriteAccess(allowed: true);
    newsObject.setACL(parseAcl);*/

      //criando relacao entre o objeto News (tabela News) e o objeto Field (tabela Field)
      newsObject.set<ParseObject>(keyNewsField, ParseObject(keyFieldTable)..set(keyFieldId, news.field!.id));

      //demais campos
      newsObject.set<String>(keyNewsTitle, news.title!);
      newsObject.set<String>(keyNewsContent, news.content!);

      final response = await newsObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha ao salvar News: ${e.toString()}');
    }
  }

  Future<void> delete(News news) async {
    final parseObject = ParseObject(keyNewsTable)..set(keyProjectId, news.id);

    //parseObject.set(keyAdStatus, AdStatus.DELETED.index);

    final response = await parseObject.save();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
