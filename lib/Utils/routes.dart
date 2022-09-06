import 'package:belanja/models/supermarket_model.dart';
import 'package:belanja/screens/masters/mstlocation_screen.dart';
import 'package:belanja/screens/transaction/operationtrx_screen.dart';
import 'package:belanja/screens/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/masters/mstsuper_screen.dart';

class Routes {
  Map<String, WidgetBuilder> getRoutes = {
    '/': (_) => HomeScreen(),
    '/mastersupermarket': (_) => MasterSupermarketScreen(),
    '/masterlocation': (_) =>
        MasterLocationScreen(data: SupermarketModel(name: "")),
    '/transaction': (_) => TransactionScreen(),
    '/transaction/operation': (_) => OperationTransactionScreen(),
  };
}
