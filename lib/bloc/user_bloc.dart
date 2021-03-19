import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../services/users_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc({this.usersRepository})
      : assert(usersRepository != null),
        super(UserEmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUsers: _loadedUserList);
      } catch (e) {
        yield UserErrorState(error: e.toString());
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}
