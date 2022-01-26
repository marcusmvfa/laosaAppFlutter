import 'package:flutter/material.dart';
import 'package:laosa_app/src/view/pedidos/pedido.dart';

class ListagemPedidos extends StatelessWidget {
  const ListagemPedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      color: Colors.grey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [Text("Pedidos em Andamento"), Text("5")],
              ),
              Column(
                children: [Text("Pedidos Prontos"), Text("0")],
              )
            ],
          ),
          Text("Pedidos"),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Pedido();
                }),
          )
        ],
      ),
    );
  }
}
