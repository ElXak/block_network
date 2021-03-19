import '../models/user.dart';
import 'users_api_provider.dart';

class UsersRepository {
  UsersProvider _usersProvider = UsersProvider();

  Future<List<User>> getAllUsers() => _usersProvider.getUsers();
}
