import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: const Text("Clientes"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
