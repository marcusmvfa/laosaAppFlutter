import 'package:flutter/material.dart';

class ClientesCreateEdit extends StatefulWidget {
  const ClientesCreateEdit({Key? key}) : super(key: key);
  static const routeName = "/clientes/create_edit";
  @override
  State<ClientesCreateEdit> createState() => _ClientesCreateEditState();
}

class _ClientesCreateEditState extends State<ClientesCreateEdit> {
  bool revendedora = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Criar Cliente"),
          actions: const [IconButton(onPressed: null, icon: Icon(Icons.edit))]),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(children: [
            Row(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Nome"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(children: [
                    const Text("Revendora"),
                    Switch(
                      value: revendedora,
                      activeColor: Colors.purple,
                      onChanged: (value) => revendedora = value,
                    ),
                  ]),
                ),
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(label: Text("Telefone")),
                ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
