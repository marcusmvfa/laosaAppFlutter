import 'package:flutter/material.dart';
import 'package:laosa_app/src/view/pedidos/dados_pedido.dart';

class Pedido extends StatefulWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  _PedidoState createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.restorablePushNamed(context, DadosPedido.routeName),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cliente: Eliane"),
                  Row(children: [
                    Text("Situação: "),
                    Icon(Icons.pending_outlined, color: Colors.amber),
                  ])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("R\$ 150,00"),
                  Row(
                    children: [Icon(Icons.date_range_outlined), Text("25/01/2022")],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
