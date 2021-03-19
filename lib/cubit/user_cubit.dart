import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../services/users_repository.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository usersRepository;

  UserCubit({this.usersRepository})
      : assert(usersRepository != null),
        super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUsersList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUsers: _loadedUsersList));
    } catch (e) {
      emit(UserErrorState(error: e.toString()));
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
