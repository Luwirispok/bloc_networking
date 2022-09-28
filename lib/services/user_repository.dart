import 'package:bloc_networking/models/user.dart';
import 'package:bloc_networking/services/user_provider.dart';

class UserRepository{
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}