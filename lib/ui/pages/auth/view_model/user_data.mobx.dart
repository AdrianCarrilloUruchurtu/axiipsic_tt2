import 'package:mobx/mobx.dart';
part 'user_data.mobx.g.dart';

class UserDataStore = _UserDataStoreBase with _$UserDataStore;

abstract class _UserDataStoreBase with Store {}
