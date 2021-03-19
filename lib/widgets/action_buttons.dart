import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/user_bloc.dart';
// import '../bloc/user_event.dart';
import '../cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = context.read<UserCubit>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.green),
          child: Text('Load'),
          onPressed: () {
            // userBloc.add(UserLoadEvent());
            userCubit.fetchUsers();
          },
        ),
        SizedBox(width: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: Text('Clear'),
          onPressed: () {
            // userBloc.add(UserClearEvent());
            userCubit.clearUsers();
          },
        ),
      ],
    );
  }
}
