import 'package:flutter/material.dart';
import 'package:laosa_app/src/view/pedidos/pedido_item.dart';

class DadosPedido extends StatelessWidget {
  const DadosPedido({Key? key}) : super(key: key);

  static const routeName = "/dadosPedido";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Dados do Pedido"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Cliente: Eliane"), Text("Entrega 02/02/2022")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Total: R\$ 150.00")],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return PedidoItem();
                })
          ],
        ),
      ),
    );
  }
}
