import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../../services/user_repo.dart';
part 'auth_mobx.g.dart';

@injectable
class AuthMobx = _AuthMobxBase with _$AuthMobx;

abstract class _AuthMobxBase with Store {
  final _userRepo = GetIt.instance.get<UserRepo>();

  _AuthMobxBase() {
    _userRepo.userList().listen((event) {
      userLista = event;
    });

    _userRepo.psicList().listen((event) {
      psicList = event;
    });

    FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        user = await _userRepo.get(event.uid);
      } else {
        user = null;
      }
    });
  }

  @action
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  @action
  addCampo(String? psicCampo) {
    _userRepo.addCampo(psicCampo);
  }

  @action
  getUserById(String? friendId) {
    _userRepo.getUserByFriendId(friendId);
  }

  @action
  saveToken(String? token) {
    _userRepo.saveToken(token);
  }

  @observable
  UserData? user;

  @observable
  List<UserData>? userLista;

  @observable
  List<UserData>? psicList;
}
