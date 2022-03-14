import 'package:flutter/material.dart';
import 'package:laosa_app/src/view/clientes/clientes_create_edit.dart';
import 'package:laosa_app/src/view/clientes/components/clientes_header.dart';
import 'package:laosa_app/src/view/clientes/components/clientes_list.dart';

class ClientesView extends StatelessWidget {
  const ClientesView({Key? key}) : super(key: key);

  static const route = "/clientes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Clientes"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ClientesCreateEdit.routeName),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: const [ClientesHeader(), ClientesList()]),
      ),
    );
  }
}
