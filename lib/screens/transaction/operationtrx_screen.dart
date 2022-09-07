import 'package:belanja/databases/sqldatabase.dart';
import 'package:belanja/state_management/supermarket_bloc/supermarket_bloc.dart';
import 'package:belanja/state_management/transaction_bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperationTransactionScreen extends StatelessWidget {
  OperationTransactionScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SqlDatabase sqldatabase = SqlDatabase.instance;

  @override
  Widget build(BuildContext context) {
    String? selectedDropdownSuper = "";
    List<String> listSuper = [];
    List<String> listLocation = [];

    TextEditingController itemNameController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Transaksi"),
      ),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SuccessInitialTransaction) {
            listSuper = state.result["supermarket"];
            listLocation = state.result["location"];
            selectedDropdownSuper = state.result["selectedSupermarket"];

            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DropdownButton(
                    value: (selectedDropdownSuper == "")
                        ? selectedDropdownSuper
                        : listSuper.first,
                    items:
                        listSuper.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedDropdownSuper = value;
                      sqldatabase.readSupermarketByName(value!);
                      context.read<TransactionBloc>().add(
                          ChangeSupernLocationEvent(supermarketName: value));
                      print(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButton(
                    value: listLocation.first,
                    items: listLocation
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.person),
                      hintText: 'Nama, Merk, Berat',
                      labelText: 'Nama Barang, Merk, Berat *',
                    ),
                    onSaved: (String? value) {
                      print("onsaved : $value");
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Barang Kosong !';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.person),
                      hintText: 'Harga Barang',
                      labelText: 'Harga *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga Kosong !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print("OKKKK");
                        }
                      },
                      child: const Text("Simpan")),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
