import 'package:academias/shared/models/user_abastract.dart';
import 'package:academias/shared/models/user_client.dart';

class UserTrainer extends AbastractUser {
  // Lista de ids dos cliente <API>
  List<int>? listClientIds;

  // Lista dos Clientes
  List<UserClient>? listClients;
}
