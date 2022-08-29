import 'package:belanja/state_management/supermarket_bloc/supermarket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'masters/mstsuper_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Belanja")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      drawer: drawerMenu(),
    );
  }
}

class drawerMenu extends StatelessWidget {
  const drawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Transaksi'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Komparasi'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(height: 3, color: Colors.black),
          ListTile(
            title: const Text('Master Supermarket'),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MasterSupermarketScreen(),
              ));
              context.read<SupermarketBloc>().add(ViewAllSupermarket());
            },
          ),
          ListTile(
            title: const Text('Master Lokasi'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(height: 3, color: Colors.black),
          ListTile(
            title: const Text('Setting'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}