import 'package:flutter/material.dart';
import 'package:laosa_app/src/models/pedido_item_model.dart';
import 'package:laosa_app/src/models/pedido_model.dart';
import 'package:laosa_app/src/providers/pedido_provider.dart';
import 'package:laosa_app/src/view/pedidos/dados_pedido.dart';
import 'package:provider/provider.dart';

class Pedido extends StatefulWidget {
  const Pedido(this.pedido, {Key? key}) : super(key: key);
  final PedidoModel pedido;

  @override
  _PedidoState createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  itensPedidoToString(PedidoItemModel item) {
    String description = "";
    for (int i = 0; i < 3; i++) {
      // description += "${item.qnt} - ${item.tipo} ";
      description += "${item.qnt} - ${item.tipo} ";
    }
  }

  @override
  Widget build(BuildContext context) {
    var ctrl = Provider.of<PedidoProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        ctrl.pedidoSelecionado = widget.pedido;
        Navigator.restorablePushNamed(context, DadosPedido.routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    labelPadding: const EdgeInsets.all(1),
                    backgroundColor: const Color(0xff3F72AF),
                    label: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(
                          Icons.person_outline,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          "Eliane",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: const [
                      Icon(Icons.local_shipping),
                      Text(
                        "25/01/2022",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const Chip(
                      labelPadding: EdgeInsets.all(0),
                      backgroundColor: Color(0xffFF7E67),
                      label: Text(
                        "Pendente",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "3 - Calcinhas | 1 - Maio | 2 - Biquini",
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                    Text("R\$ 150,00"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
