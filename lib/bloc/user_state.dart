import 'package:flutter/foundation.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<dynamic> loadedUsers;
  UserLoadedState({@required this.loadedUsers}) : assert(loadedUsers != null);
}

class UserErrorState extends UserState {
  String error;
  UserErrorState({@required this.error}) : assert(error != null);
}
