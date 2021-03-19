import 'package:block_network/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/user_bloc.dart';
// import '../bloc/user_state.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text(
            'No data received. Press button "Load"',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        );
      }

      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUsers.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedUsers[index].id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    state.loadedUsers[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Email: ${state.loadedUsers[index].email}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Phone: ${state.loadedUsers[index].phone}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }

      if (state is UserErrorState) {
        return Center(
          child: Text(
            'Error fetching users - ${state.error}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      return Center(
        child: Text(
          'Press button "Load" to load users',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      );
    });
  }
}
