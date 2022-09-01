import 'package:belanja/models/supermarket_model.dart';
import 'package:belanja/screens/widgets/customWidgets.dart';
import 'package:belanja/state_management/supermarket_bloc/supermarket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterLocationScreen extends StatelessWidget {
  SupermarketModel data;
  MasterLocationScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as SupermarketModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                CustomWidgets.basicShowDialog(context, "Hapus",
                    "Apakah Anda Yakin Menghapus Data Supermarket Ini ?", () {
                  BlocProvider.of<SupermarketBloc>(context)
                      .add(DeleteSuperMarket(idSupermarket: data.id));
                });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Penambahan Lokasi"),
                    content: TextField(
                      textCapitalization: TextCapitalization.characters,
                      controller: locationController,
                      autofocus: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Nama Lokasi ${data.name}",
                      ),
                      onSubmitted: (value) {
                        locationController.text = value;
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
                          print("${data.id}, ${locationController.text}");

                          context.read<SupermarketBloc>().add(
                              AddLocationSupermarket(
                                  idSupermarket: data.id ?? 0,
                                  locationName: locationController.text));
                          Navigator.pop(context);
                          context.read<SupermarketBloc>().add(
                              ViewLocationById(idSupermarket: data.id ?? 0));
                        },
                        child: const Text("Proses"),
                      )
                    ],
                  );
                });
          },
          child: Icon(Icons.add)),
      body: BlocListener<SupermarketBloc, SupermarketState>(
        listener: (context, state) {
          if (state is FailureLocationSupermarket) {
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
                          // context
                          //     .read<SupermarketBloc>()
                          //     .add(ViewAllSupermarket());
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                });
          }
          if (state is SuccessDeleteSupermarket) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Sukses"),
                    content: const Text("Data Berhasil Dihapus"),
                    actions: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                              ..pop()
                              ..pop();

                            context
                                .read<SupermarketBloc>()
                                .add(ViewAllSupermarket());
                            Navigator.pushNamed(context, '/mastersupermarket');
                          },
                          child: const Text("OK"))
                    ],
                  );
                });
          }
        },
        child: BlocConsumer<SupermarketBloc, SupermarketState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is LoadingViewLocationById) {
              return Container(child: CircularProgressIndicator.adaptive());
            }
            if (state is FailureViewLocationById) {
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
                            // context
                            //     .read<SupermarketBloc>()
                            //     .add(ViewAllSupermarket());
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  });
            }
            if (state is SuccessViewLocationById) {
              var result = state.result;

              return Column(
                children: <Widget>[
                  (result.isEmpty)
                      ? const Expanded(
                          child: Center(
                          child: Text("Tidak Ada Data"),
                        ))
                      : Expanded(
                          child: ListView.builder(
                            itemCount: result.length,
                            itemBuilder: (context, index) {
                              return Text("data");
                              // return ListTile(
                              //   title: Text(result[index].locationName),
                              // );
                            },
                          ),
                        ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
