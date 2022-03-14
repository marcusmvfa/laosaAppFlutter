import 'package:flutter/material.dart';

class ClientesList extends StatefulWidget {
  const ClientesList({Key? key}) : super(key: key);

  @override
  State<ClientesList> createState() => _ClientesListState();
}

class _ClientesListState extends State<ClientesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text("Nome do Cliente"),
            subtitle: const Text("Revendedora/Cliente"),
            trailing: IconButton(
                onPressed: () => debugPrint("printou o cliente"), icon: const Icon(Icons.whatsapp)),
          );
        });
  }
}
