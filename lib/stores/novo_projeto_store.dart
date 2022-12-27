import 'package:mobx/mobx.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'novo_projeto_store.g.dart';

class NovoProjetoStore = _NovoProjetoStore with _$NovoProjetoStore;

abstract class _NovoProjetoStore with Store {
  ObservableList images = ObservableList();
}
