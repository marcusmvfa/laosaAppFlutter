import 'package:flutter/material.dart';
import 'package:laosa_app/src/view/drawer/drawer_widget.dart';
import 'package:laosa_app/src/view/pedidos/listagem_pedidos.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text("Tela Inicial"),
        ),
      ),
      drawer: const DrawerWidget(),
      body: ListagemPedidos(),
    );
  }
}
