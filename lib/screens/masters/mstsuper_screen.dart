import 'package:belanja/Data/supermaket.dart';
import 'package:belanja/state_management/supermarket_bloc/supermarket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen.dart';

class MasterSupermarketScreen extends StatelessWidget {
  MasterSupermarketScreen({Key? key}) : super(key: key);

  Supermarket supermarket = Supermarket();

  TextEditingController superNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawerMenu(),
      appBar: AppBar(
        title: const Text("Master Supermarket"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Penambahan Data"),
                    content: TextField(
                      textCapitalization: TextCapitalization.characters,
                      controller: superNameController,
                      autofocus: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Nama Supermarket",
                      ),
                      onSubmitted: (value) {
                        superNameController.text = value;
                      },
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Batal"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<SupermarketBloc>().add(AddNewSuperMarket(
                              nameSupermarket: superNameController.text));
                        },
                        child: const Text("Proses"),
                      )
                    ],
                  );
                });
          },
          child: Icon(Icons.add)),
      body: BlocConsumer<SupermarketBloc, SupermarketState>(
        listener: (context, state) {
          if (state is SuccessAddNewSupermarket) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Center(
                      child: Icon(Icons.abc),
                    ),
                    content: Text("Data Berhasil Disimpan"),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context
                              .read<SupermarketBloc>()
                              .add(ViewAllSupermarket());
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                });
          }
          if (state is FailureAddNewSupermarket) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Center(
                      child: Icon(Icons.disabled_by_default_rounded),
                    ),
                    content: Text(state.messageError.toString()),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context
                              .read<SupermarketBloc>()
                              .add(ViewAllSupermarket());
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                });
          }
        },
        builder: (context, state) {
          if (state is SuccessViewSupermarket) {
            print("jalannnnn");
            var result = state.result;
            if (result.isEmpty) {
              return const Center(child: Text("Tidak Ada Data"));
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print("object ${result[index].id}");
                        Navigator.pushNamed(context, '/masterlocation',
                            arguments: result[index]);
                        context.read<SupermarketBloc>()
                          ..add(ViewLocationById(
                              idSupermarket: result[index].id ?? 0));
                      },
                      child: Container(
                        color: (index % 2 == 0) ? Colors.amber : Colors.blue,
                        child: ListTile(
                          title: Text(result[index].name),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
