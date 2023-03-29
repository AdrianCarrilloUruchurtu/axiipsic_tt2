import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../services/tips_repo.dart';
import '../model/tips_model.dart';
part 'tipsMobx.g.dart';

class TipsMobx = _TipsMobxBase with _$TipsMobx;

abstract class _TipsMobxBase with Store {
  final _tipsRepo = getIt<TipsRepo>();

  _TipsStoreBase() {
    _tipsRepo.tipsChanges().listen((event) {
      tipList = event;
    });
  }

  @observable
  List<TipsData>? tipList;
}
