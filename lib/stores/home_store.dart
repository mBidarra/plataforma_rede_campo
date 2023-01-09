import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:plataforma_rede_campo/helpers/extensions.dart';
import 'package:plataforma_rede_campo/repositories/news_repository.dart';

import '../models/news.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'home_store.g.dart';

AnsiPen greenPen = AnsiPen()..green();

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    _getNewsList();
  }

  ObservableList<News> newsList = ObservableList<News>();

  @action
  Future<void> _getNewsList() async {
    try {
      setLoading(true);
      newsList.clear();
      final news = await NewsRepository().getAllNews();
      newsList.addAll(news);
      setLoading(false);
      if (kDebugMode) {
        print(greenPen(newsList.length));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @observable
  String? email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError {
    if (!showErrors || emailValid) {
      return null;
    } else {
      return 'E-mail invalido';
    }
  }

  @observable
  bool showErrors = false;

  @action
  void setShowErrors(bool value) => showErrors = value;

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @action
  void invalidSendPressed() => showErrors = true;

  @computed
  dynamic get subscribeNewsletterPressed => (emailValid && !loading) ? _subscribeNewsletter : null;

  @action
  Future<void> _subscribeNewsletter() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 4));
    setLoading(false);
  }
}
