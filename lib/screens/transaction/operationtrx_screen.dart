import 'package:belanja/databases/sqldatabase.dart';
import 'package:belanja/state_management/supermarket_bloc/supermarket_bloc.dart';
import 'package:belanja/state_management/transaction_bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/static_widgets.dart';

class OperationTransactionScreen extends StatelessWidget {
  OperationTransactionScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SqlDatabase sqldatabase = SqlDatabase.instance;

  @override
  Widget build(BuildContext context) {
    String? selectedDropdownSuper = "";
    String? selectedDropdownLocation = "";
    List<String> listSuper = [];
    List<String> listLocation = [];

    const List<String> _kOptions = <String>[
      'test',
      'aardvark',
      'bobcat',
      'chameleon',
    ];

    TextEditingController itemNameController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Input Transaksi")),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          //
        },
        builder: (context, state) {
          if (state is SuccessInitialTransaction) {
            listSuper = state.result["supermarket"];
            listLocation = state.result["location"];

            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DropdownButton(
                    value: (selectedDropdownSuper == "")
                        ? listSuper.first
                        : selectedDropdownSuper,
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
                  sb30,
                  DropdownButton(
                    // value: listLocation.first,
                    value: (selectedDropdownLocation == "")
                        ? listLocation.first
                        : selectedDropdownLocation,
                    items: listLocation
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // selectedDropdownLocation = value;
                      selectedDropdownLocation = value;
                      // sqldatabase.readSupermarketByName(value!);
                      context.read<TransactionBloc>().add(
                          ChangeSupernLocationEvent(
                              supermarketName: selectedDropdownSuper!,
                              supermarketLocation: value!));
                      print(value);
                    },
                  ),
                  // sb30,

                  // // itemName
                  // Autocomplete<String>(
                  //   optionsBuilder: (TextEditingValue textEditingValue) {
                  //     if (textEditingValue.text == '') {
                  //       return const Iterable<String>.empty();
                  //     }
                  //     return _kOptions.where((String option) {
                  //       return option
                  //           .contains(textEditingValue.text.toLowerCase());
                  //     });
                  //   },
                  //   onSelected: (String selection) {
                  //     print("selected : $selection");
                  //     itemNameController.text = selection;
                  //   },
                  // ),

                  // // TextFormField(
                  // //   keyboardType: TextInputType.text,
                  // //   decoration: const InputDecoration(
                  // //     hintText: 'Nama, Merk, Berat',
                  // //     labelText: 'Nama Barang, Merk, Berat *',
                  // //   ),
                  // //   onSaved: (String? value) {
                  // //     print("onsaved : $value");
                  // //     // This optional block of code can be used to run
                  // //     // code when the user saves the form.
                  // //   },
                  // //   validator: (String? value) {
                  // //     if (value == null || value.isEmpty) {
                  // //       return 'Nama Barang Kosong !';
                  // //     }
                  // //     return null;
                  // //   },
                  // // ),
                  // TextFormField(
                  //   controller: amountController,
                  //   keyboardType: TextInputType.number,
                  //   decoration: const InputDecoration(
                  //     hintText: 'Harga Barang',
                  //     labelText: 'Harga *',
                  //   ),
                  //   onSaved: (String? value) {
                  //     amountController.text = value ?? "0";
                  //   },
                  //   validator: (String? value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Harga Kosong !';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  sb30,
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print("---------------");
                          print("super : $selectedDropdownSuper");
                          // print("location : $selectedDropdownLocation");
                          // print("itemName : ${itemNameController.text}");
                          // print("amount : ${amountController.text}");
                          print("---------------");
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
