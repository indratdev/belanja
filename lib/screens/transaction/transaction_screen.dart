import 'package:belanja/state_management/transaction_bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawerMenu(),
      appBar: AppBar(
        title: const Text("Transaksi"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/transaction/operation");
            BlocProvider.of<TransactionBloc>(context)
                .add(InitialTransactionEvent());
          },
          child: const Icon(Icons.add)),
    );
  }
}
