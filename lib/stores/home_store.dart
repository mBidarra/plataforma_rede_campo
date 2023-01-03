import 'package:mobx/mobx.dart';

import '../models/news.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {}

  ObservableList<News> newsList = ObservableList<News>();

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;
}
