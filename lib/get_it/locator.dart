
import 'package:flutter_widget_practice/get_it/user.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator(){
  locator.registerLazySingleton(() => User());
}