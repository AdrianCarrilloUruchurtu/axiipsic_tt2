import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../../../../../../services/tips_repo.dart';
import '../model/tips_model.dart';
part 'tipsMobx.g.dart';

@injectable
class TipsMobx = _TipsMobxBase with _$TipsMobx;

abstract class _TipsMobxBase with Store {
  final _tipsRepo = getIt<TipsRepo>();

  _TipsMobxBase(String pac) {
    _tipsRepo.tipsChanges(pac).listen((event) {
      tipList = event;
    });
  }

// Falta creación y eliminación de los tips
  @action
  crearTip(
    String creationDate,
    String tipContent,
    List<String> owners,
  ) {
    _tipsRepo.tipAdd(creationDate, tipContent, owners);
  }

  @observable
  List<TipsData>? tipList;
}
