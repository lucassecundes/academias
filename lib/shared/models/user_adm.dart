import 'package:academias/shared/models/user_abastract.dart';
import 'package:academias/shared/models/user_trainer.dart';

class UserAdm extends AbastractUser {
  String? gymName;
  String? gymLogoImg;
  List<int>? listTrainerIds;
  List<UserTrainer>? listUserTrainers;
}
