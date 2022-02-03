import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_item_model.dart';

import 'package:laosa_app/src/view/pedidos/edit_pedido_item.dart';

class PedidoItem extends StatefulWidget {
  const PedidoItem(this.pedido, {Key? key}) : super(key: key);
  final PedidoItemModel pedido;

  @override
  _PedidoItemState createState() => _PedidoItemState();
}

class _PedidoItemState extends State<PedidoItem> {
  @override
  Widget build(BuildContext context) {
    final pedido = widget.pedido;
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) => EditPedidoItem(pedido: pedido));
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 36,
                    child: Text(pedido.qnt.toString()),
                  ),
                  Text(pedido.tipo.value.name),
                  Text("Tam: ${pedido.tamInferior.value.name}"),
                  Text("Extra: ${pedido.extraInferior}"),
                  const Icon(Icons.pending, color: Colors.amber),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
