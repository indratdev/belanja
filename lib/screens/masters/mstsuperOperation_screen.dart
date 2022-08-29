// import 'package:belanja/models/supermarket_model.dart';
// import 'package:belanja/state_management/supermarket_bloc/supermarket_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MasterSuperOperationScreen extends StatelessWidget {
//   MasterSuperOperationScreen({Key? key}) : super(key: key);

//   TextEditingController nameSuper = TextEditingController();
//   TextEditingController locationSuper = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Tambah Supermarket"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: BlocConsumer<SupermarketBloc, SupermarketState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             if (state is LoadingAddNewSupermarket) {
//               return Center(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const <Widget>[
//                       CircularProgressIndicator.adaptive(),
//                       Text("Loading")
//                     ]),
//               );
//             }

//             if (state is SuccessAddNewSupermarket) {
//               Future.delayed(
//                 Duration(microseconds: 1),
//                 () {
//                   showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Simpan Data"),
//                           content: Text("Berhasil Simpan Data"),
//                           actions: [
//                             ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text("OK"))
//                           ],
//                         );
//                       });
//                 },
//               );

//               // return Container(
//               //   height: MediaQuery.of(context).size.height / 4,
//               //   width: MediaQuery.of(context).size.height / 4,
//               //   child: Column(
//               //     mainAxisAlignment: MainAxisAlignment.center,
//               //     crossAxisAlignment: CrossAxisAlignment.center,
//               //     children: [
//               //       ListTile(
//               //         title: Text('Berhasil'),
//               //         subtitle: Text("Data Baru Sukses Disimpan"),
//               //       ),
//               //       SizedBox(height: 10),
//               //       ElevatedButton(
//               //           onPressed: () {
//               //             Navigator.pop(context);
//               //           },
//               //           child: Text("OK"))
//               //     ],
//               //   ),
//               // );
//             }

//             return Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text("Nama Supermarket :"),
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: nameSuper,
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                       labelText: 'Masukan nama supermarket',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(width: 3, color: Colors.blue),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         // borderSide: const BorderSide(width: 3, color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       )),
//                 ),
//                 SizedBox(height: 10),
//                 Text("Lokasi Supermarket :"),
//                 TextField(
//                   controller: locationSuper,
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                       labelText: 'Masukan lokasi supermarket',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(width: 3, color: Colors.blue),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         // borderSide: const BorderSide(width: 3, color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       )),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     ElevatedButton(
//                       child: Text("Batal"),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         onPrimary: Colors.red,
//                         shadowColor: Colors.blue,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0)),
//                         minimumSize: Size(
//                           MediaQuery.of(context).size.width / 3,
//                           MediaQuery.of(context).size.width / 8,
//                         ), //////// HERE
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     ElevatedButton(
//                       child: Text("Simpan"),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         onPrimary: Colors.white,
//                         shadowColor: Colors.blue,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0)),
//                         minimumSize: Size(
//                           MediaQuery.of(context).size.width / 3,
//                           MediaQuery.of(context).size.width / 8,
//                         ), //////// HERE
//                       ),
//                       onPressed: () {
//                         if (nameSuper.text != "" && locationSuper.text != "") {
//                           var value = SupermarketModel(
//                               name: nameSuper.text,
//                               locationName: locationSuper.text);
//                           BlocProvider.of<SupermarketBloc>(context)
//                               .add(AddNewSuperMarket(supermarket: value));
//                         }
//                       },
//                     ),
//                   ],
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
