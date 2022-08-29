import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/masters/mstsuperOperation_screen.dart';
import '../screens/masters/mstsuper_screen.dart';

class Routes {
  Map<String, WidgetBuilder> getRoutes = {
    '/': (_) => HomeScreen(),
    '/mastersupermarket': (_) => MasterSupermarketScreen(),
    // '/mastersupermarketOper': (_) => MasterSuperOperationScreen(),
  };
}
