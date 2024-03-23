import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/drawer/drawer_event.dart';
import 'package:grocery_app/bloc/drawer/drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent,DrawerState>{
  DrawerBloc():super(DummyDrawerState()){
    on<LogOutEvent>(logOut);
  }

  Future<void> logOut(LogOutEvent event, Emitter<DrawerState> emit) async{
    print("Logout pandra event ku vantea");
    emit(DummyDrawerState());
    emit(LogoutState());
  }
}