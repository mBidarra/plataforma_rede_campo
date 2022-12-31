import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/repositories/parse_errors.dart';
import 'package:plataforma_rede_campo/repositories/table_keys.dart';
import '../models/news.dart';

class NewsRepository {
  Future<List<News>> getAllNews() async {
    return Future.error('error');
  }

  Future<void> saveNews(News news) async {
    final newsObject = ParseObject(keyNewsTable);

    //verifica se esta sendo editado uma news
    if (news.id != null) {
      newsObject.objectId = news.id;
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
