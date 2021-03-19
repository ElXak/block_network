import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/user_bloc.dart';
import '../cubit/user_cubit.dart';
import '../services/users_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final UsersRepository usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      // create: (context) => UserBloc(usersRepository: usersRepository),
      create: (context) => UserCubit(usersRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(
              child: UserList(),
            ),
          ],
        ),
      ),
    );
  }
}
