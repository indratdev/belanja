import 'package:belanja/models/supermarket_model.dart';
import 'package:belanja/screens/widgets/customwidgets.dart';
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
    return WillPopScope(
      onWillPop: () async {
        context.read<SupermarketBloc>().add(ViewAllSupermarket());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(data.name),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  CustomWidgets.basicShowDialog(context, "Hapus",
                      "Apakah Anda Yakin Menghapus Data Supermarket Ini ?", () {
                    BlocProvider.of<SupermarketBloc>(context)
                        .add(DeleteSuperMarket(idSupermarket: data.id));
                    Navigator.pop(context);
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
                            context.read<SupermarketBloc>().add(
                                AddLocationSupermarket(
                                    idSupermarket: data.id ?? 0,
                                    locationName: locationController.text));

                            Navigator.pop(context);
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
            if (state is SuccessDeleteLocationById) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil Hapus Lokasi"),
                  backgroundColor: Colors.green,
                ),
              );
              context
                  .read<SupermarketBloc>()
                  .add(ViewLocationById(idSupermarket: data.id ?? 0));
            }
            if (state is FailureDeleteLocationById) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal Hapus Lokasi"),
                  backgroundColor: Colors.red,
                ),
              );
              context
                  .read<SupermarketBloc>()
                  .add(ViewLocationById(idSupermarket: data.id ?? 0));
            }
            if (state is SuccessDeleteSupermarket) {
              CustomWidgets.showDialogOK(
                  context, "Berhasil", "Supermarket Berhasil Dihapus", () {
                Navigator.of(context)
                  ..pop()
                  ..pop();

                context.read<SupermarketBloc>().add(ViewAllSupermarket());
              });
            }
            if (state is FailureLocationSupermarket) {
              CustomWidgets.showDialogOK(
                  context, "GAGAL", state.messageError.toString(), () {
                Navigator.pop(context);
                context
                    .read<SupermarketBloc>()
                    .add(ViewLocationById(idSupermarket: data.id ?? 0));
              });
            }
            if (state is SuccessAddLocationSupermarket) {
              CustomWidgets.showDialogOK(
                  context, "Berhasil", "Penambahan Lokasi Berhasil", () {
                Navigator.pop(context);
                context
                    .read<SupermarketBloc>()
                    .add(ViewLocationById(idSupermarket: data.id ?? 0));
              });
            }
          },
          builder: (context, state) {
            if (state is SuccessViewLocationById) {
              var result = state.result;
              return ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      CustomWidgets.basicShowDialog(context, "Hapus Lokasi",
                          "Apakah Anda Yakin Hapus Lokasi Ini ?", () {
                        context.read<SupermarketBloc>().add(DeleteLocationById(
                            idLocation: state.result[index].id));
                        Navigator.pop(context);
                      });
                    },
                    child: ListTile(
                      title: Text(result[index].locationName),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Tidak Ada Data"));
            }
          },
        ),
      ),
    );
  }
}
